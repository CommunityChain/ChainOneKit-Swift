//
//  UIFont+PingFangSC.swift
//  ChainOneKit-Swift
//
//  Created by 小唐 on 2020/12/1.
//  Copyright © 2019 2020. All rights reserved.
//
//  平方字体扩展

import Foundation
import UIKit

extension UIFont {

    /// 平方字体
    class func pingFangSCFont(size: CGFloat, weight: UIFont.Weight = UIFont.Weight.regular) -> UIFont {

        var fontName: String = "PingFangSC-Regular"
        switch weight {
        case UIFont.Weight.regular:
            fontName = "PingFangSC-Regular"
        case UIFont.Weight.medium:
            fontName = "PingFangSC-Medium"
        case UIFont.Weight.light:
            fontName = "PingFangSC-Light"
        case UIFont.Weight.semibold:
            fontName = "PingFangSC-Semibold"
        case UIFont.Weight.bold:
            fontName = "PingFangSC-Bold"
        case UIFont.Weight.thin:
            fontName = "PingFangSC-Thin"
        case UIFont.Weight.ultraLight:
            fontName = "PingFangSC-UltraLight"
        default:
            break
        }
        let pingfangFont = UIFont.init(name: fontName, size: size)
        if let pingfangFont = pingfangFont {
            return pingfangFont
        }

        let systemFont = UIFont.systemFont(ofSize: size, weight: weight)
        return systemFont
    }

}
