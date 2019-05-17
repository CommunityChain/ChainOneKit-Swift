//
//  UIImage+Extension.swift
//  SwiftKit-XiaoDe
//
//  Created by 小唐 on 25/06/2018.
//  Copyright © 2018 TangXiaoDe. All rights reserved.
//
//  UIImage的扩展方法

import Foundation
import UIKit

// MARK: - Initialization Function

public extension UIImage {

}

public extension UIImage {
    /// 图片的机型适配
//    public class func imageNamedOnDevice(name: String) -> UIImage {
//        var image:String = name
////        if QJWDevice.isPhone6Plus() {
////            image = String(format: "%@-6p", name)
////        } else if QJWDevice.isPhone5() {
////            image = String(format: "%@-5", name)
////        } else {
////            image = String(format: "%@-6", name)
////        }
//        return UIImage(named: String(format: "%@.png", image))!
//    }
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

}
