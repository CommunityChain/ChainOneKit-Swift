//
//  UIImage+Extension.swift
//  SwiftKit-XiaoDe
//
//  Created by 小唐 on 25/06/2018.
//  Copyright © 2018 ChainOne. All rights reserved.
//
//  UIImage的扩展方法

import Foundation
import UIKit

// MARK: - Initialization Function

public extension UIImage {

    // 根据图片的中心点去拉伸图片并返回
    func resizableImageWithCenterPoint() -> UIImage {
        let top = self.size.height * 0.5 - 1.0      // 顶端盖高度
        let bottom = top                            // 底端
        let left = self.size.width * 0.5 - 1.0      // 左
        let right = left                            // 右
        let insets = UIEdgeInsets.init(top: top, left: left, bottom: bottom, right: right)
        let image = self.resizableImage(withCapInsets: insets, resizingMode: UIImage.ResizingMode.stretch)

        return image
    }
    
    // 根据图片的固定点去拉伸图片并返回
    func resizableImage(with point: CGPoint) -> UIImage {
        let top = point.y                           // 顶端盖高度
        let bottom = self.size.height - top - 1.0   // 底端
        let left = point.x                          // 左
        let right = self.size.width - left - 1.0    // 右
        let insets = UIEdgeInsets.init(top: top, left: left, bottom: bottom, right: right)
        let image = self.resizableImage(withCapInsets: insets, resizingMode: UIImage.ResizingMode.stretch)

        return image
    }

}

public extension UIImage {

    // 根据指定颜色 构造 1像素的图片
    class func imageWithColor(_ color: UIColor) -> UIImage {
        let imageW: CGFloat = 1
        let imageH: CGFloat = 1
        // 1.开启基于位图的图形上下文
        UIGraphicsBeginImageContextWithOptions(CGSize(width: imageW, height: imageH), false, 0.0)
        // 2.画一个color颜色的矩形框
        color.set()
        UIRectFill(CGRect(x: 0, y: 0, width: imageW, height: imageH))
        // 3.拿到图片
        let image = UIGraphicsGetImageFromCurrentImageContext()
        // 4.关闭上下文
        UIGraphicsEndImageContext()
        return image!
    }

    /// 将 view 的显示效果转成一张 image
    class func getImageFromView(_ view: UIView) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, UIScreen.main.scale)
        if let context = UIGraphicsGetCurrentContext() {
            view.layer.render(in: context)
        }
        let image: UIImage? = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }

}
