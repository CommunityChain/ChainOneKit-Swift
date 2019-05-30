//
//  UIView+Extension.swift
//  SwiftKit-XiaoDe
//
//  Created by 小唐 on 13/02/2018.
//  Copyright © 2018 ChainOne. All rights reserved.
//
//  UIView的扩展

import Foundation
import UIKit

// MARK: - Convenience Initialization

public extension UIView {
    /// 带背景色的初始化
    convenience init(bgColor: UIColor) {
        self.init(frame: CGRect.zero)
        self.backgroundColor = bgColor
    }

    /// 带圆角的普通视图(可附加边框border)，会配置masksToBounds
    @objc convenience init(cornerRadius: CGFloat, borderWidth: CGFloat = 0, borderColor: UIColor = UIColor.clear) {
        self.init(frame: CGRect.zero)
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
}

// MARK: - ChildView

public extension UIView {
    /// 移除所有子视图
    func removeAllSubView() -> Void {
        for view in self.subviews {
            view.removeFromSuperview()
        }
    }
}

// MARK: - RoundCorners

public extension UIView {

    /// 通过layer设置圆角
    @objc func set(cornerRadius: CGFloat, borderWidth: CGFloat = 0, borderColor: UIColor = UIColor.clear) -> Void {
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }

    /**
     添加圆角的方式：
     方式1.使用UIView的layer
     注：使用到masksToBounds会触发离屏渲染
     方式2.使用ShapeLayer
     注：使用mask时会触发离屏渲染
     方式3.利用 Core Graphics 画一个圆角矩形
     其他...
     */

    /// 绝对布局下给视图添加圆角 - 不需要传入视图大小，视图大小本身可知
    func addRoundCorners(_ corners: UIRectCorner, radius: CGFloat) -> Void {
        self.addRoundCorners(corners, radius: radius, viewRect: self.bounds)
    }
    /// 相对布局下给视图添加圆角 - 需要传入视图大小，视图大小不可知
    func addRoundCorners(_ corners: UIRectCorner, radius: CGFloat, viewRect: CGRect) -> Void {
        let radii = CGSize.init(width: radius, height: radius)
        let roundPath = UIBezierPath.init(roundedRect: viewRect, byRoundingCorners: corners, cornerRadii: radii)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = roundPath.cgPath
        self.layer.mask = shapeLayer
    }

    /// 绝对布局下给视图添加圆角 - radii
    private func addRoundCorners(_ corners: UIRectCorner, radii: CGSize) -> Void {
        self.addRoundCorners(corners, radii: radii, viewRect: self.bounds)
    }
    /// 相对布局下给视图添加圆角
    private func addRoundCorners(_ corners: UIRectCorner, radii: CGSize, viewRect: CGRect) -> Void {
        let roundPath = UIBezierPath.init(roundedRect: viewRect, byRoundingCorners: corners, cornerRadii: radii)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = roundPath.cgPath
        self.layer.mask = shapeLayer
    }
}

// MARK: - Dotted Line 虚线

// MARK: - 分割线 —— 四周线条的简便添加
// 该分割线的实现请使用自定义的约束实现，而不是三方库。否则应该命名为UIViewSnapKit+Extension

/// 线条位于视图的位置描述
public enum LineViewSide {
    // in 内侧
    case inBottom   // 内底(线条在view内的底部)
    case inTop      // 内顶
    case inLeft     // 内左
    case inRight    // 内右
    case inHorCenter // 水平方向居中
    case inVerCenter // 竖直方向居中
    // out 外侧
    case outBottom  // 外底(线条在view外的底部)
    case outTop     // 外顶
    case outLeft    // 外左
    case outRight   // 外右
}

public extension UIView {
    /**
     给视图添加线条
     - parameter side:      线条在视图的哪侧(内外 + 上下左右)
     - parameter color:     线条颜色
     - parameter thickness: 线条厚度(水平方向为高度，竖直方向为宽度)
     - parameter margin1:   水平方向表示左侧间距，竖直方向表示顶部间距
     - parameter margin2:             右侧间距            底部间距
     */
    //    @discardableResult
    //    func addLineWithSide(_ side: LineViewSide, color: UIColor, thickness: CGFloat, margin1: CGFloat, margin2: CGFloat) -> UIView {
    //        let lineView = UIView()
    //        self.addSubview(lineView)
    //        // 配置
    //        lineView.backgroundColor = color
    //        lineView.snp.makeConstraints { (make) in
    //            var horizontalFlag = true    // 线条方向标记
    //            switch side {
    //            // 线条为水平方向
    //            case .inBottom:
    //                make.bottom.equalTo(self)
    //                break
    //            case .inTop:
    //                make.top.equalTo(self)
    //                break
    //            case .outBottom:
    //                make.top.equalTo(self.snp.bottom)
    //                break
    //            case .outTop:
    //                make.bottom.equalTo(self.snp.bottom)
    //                break
    //            case .inHorCenter:
    //                make.centerY.equalTo(self)
    //                break
    //            // 线条方向为竖直方向
    //            case .inLeft:
    //                horizontalFlag = false
    //                make.left.equalTo(self)
    //                break
    //            case .inRight:
    //                horizontalFlag = false
    //                make.right.equalTo(self)
    //                break
    //            case .outLeft:
    //                horizontalFlag = false
    //                make.right.equalTo(self.snp.left)
    //                break
    //            case .outRight:
    //                horizontalFlag = false
    //                make.left.equalTo(self.snp.right)
    //                break
    //            case .inVerCenter:
    //                make.centerX.equalTo(self)
    //                break
    //            }
    //            // 约束
    //            if horizontalFlag   // 线条方向 为 水平方向
    //            {
    //                make.left.equalTo(self).offset(margin1)
    //                make.right.equalTo(self).offset(-margin2)
    //                make.height.equalTo(thickness)
    //            } else                // 线条方向 为 竖直方向
    //            {
    //                make.top.equalTo(self).offset(margin1)
    //                make.bottom.equalTo(self).offset(-margin2)
    //                make.width.equalTo(thickness)
    //            }
    //        }
    //        return lineView
    //    }
    
    /**
     给视图添加线条
     - parameter side:      线条在视图的哪侧(内外 + 上下左右)
     - parameter color:     线条颜色
     - parameter thickness: 线条厚度(水平方向为高度，竖直方向为宽度)
     - parameter margin1:   水平方向表示左侧间距，竖直方向表示顶部间距
     - parameter margin2:             右侧间距            底部间距
     */
    @discardableResult
    func addLineWithSide(_ side: LineViewSide, color: UIColor, thickness: CGFloat, margin1: CGFloat, margin2: CGFloat) -> UIView {
        let lineView = UIView()
        self.addSubview(lineView)
        lineView.backgroundColor = color
        // 涉及约束列举
        let widthConstraint: NSLayoutConstraint = NSLayoutConstraint.init(item: lineView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 0, constant: thickness)
        let heightConstraint: NSLayoutConstraint = NSLayoutConstraint.init(item: lineView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 0, constant: thickness)
        let centerXConstraint: NSLayoutConstraint = NSLayoutConstraint.init(item: lineView, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        let centerYConstraint: NSLayoutConstraint = NSLayoutConstraint.init(item: lineView, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0)
        let left0Constraint: NSLayoutConstraint = NSLayoutConstraint.init(item: lineView, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1, constant: 0)
        let leftMarginConstraint: NSLayoutConstraint = NSLayoutConstraint.init(item: lineView, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1, constant: margin1)
        let leftOutConstraint: NSLayoutConstraint = NSLayoutConstraint.init(item: lineView, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1, constant: 0)
        let right0Constraint: NSLayoutConstraint = NSLayoutConstraint.init(item: lineView, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1, constant: 0)
        let rightMarginConstraint: NSLayoutConstraint = NSLayoutConstraint.init(item: lineView, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1, constant: -margin2)
        let rightOutConstraint: NSLayoutConstraint = NSLayoutConstraint.init(item: lineView, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1, constant: 0)
        let top0Constraint: NSLayoutConstraint = NSLayoutConstraint.init(item: lineView, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 0)
        let topMarginConstraint: NSLayoutConstraint = NSLayoutConstraint.init(item: lineView, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: margin1)
        let topOutConstraint: NSLayoutConstraint = NSLayoutConstraint.init(item: lineView, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 0)
        let bottom0Constraint: NSLayoutConstraint = NSLayoutConstraint.init(item: lineView, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 0)
        let bottomMarginConstraint: NSLayoutConstraint = NSLayoutConstraint.init(item: lineView, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: -margin2)
        let bottomOutConstraint: NSLayoutConstraint = NSLayoutConstraint.init(item: lineView, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 0)
        // 约束添加
        var selfConstraints: [NSLayoutConstraint] = []
        var horizontalFlag = true    // 线条方向标记
        switch side {
        // 线条为水平方向
        case .inBottom:
            selfConstraints = [bottom0Constraint]
        case .inTop:
            selfConstraints = [top0Constraint]
        case .outBottom:
            selfConstraints = [bottomOutConstraint]
        case .outTop:
            selfConstraints = [topOutConstraint]
        case .inHorCenter:
            selfConstraints = [centerYConstraint]
        // 线条方向为竖直方向
        case .inLeft:
            horizontalFlag = false
            selfConstraints = [left0Constraint]
        case .inRight:
            horizontalFlag = false
            selfConstraints = [right0Constraint]
        case .outLeft:
            horizontalFlag = false
            selfConstraints = [leftOutConstraint]
        case .outRight:
            horizontalFlag = false
            selfConstraints = [rightOutConstraint]
        case .inVerCenter:
            horizontalFlag = false
            selfConstraints = [centerXConstraint]
        }
        // 约束
        if horizontalFlag {     // 线条方向 为 水平方向
            selfConstraints.append(contentsOf: [leftMarginConstraint, rightMarginConstraint])
            self.addConstraints(selfConstraints)
            lineView.addConstraint(heightConstraint)
        } else {                // 线条方向 为 竖直方向
            selfConstraints.append(contentsOf: [topMarginConstraint, bottomMarginConstraint])
            self.addConstraints(selfConstraints)
            lineView.addConstraint(widthConstraint)
        }
        return lineView
    }
    
}

