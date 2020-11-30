//
//  UILabel+Extension.swift
//  SwiftKit-XiaoDe
//
//  Created by 小唐 on 13/02/2018.
//  Copyright © 2018 ChainOne. All rights reserved.
//
//  UILabel的扩展

import Foundation
import UIKit

public extension UILabel {

    /// 便利构造
    convenience init(text: String?, font: UIFont, textColor: UIColor, alignment: NSTextAlignment = .left, numberOfLines: Int = 1) {
        self.init(frame: CGRect.zero)
        self.textColor = textColor
        self.font = font
        self.text = text
        self.textAlignment = alignment
        self.numberOfLines = numberOfLines
    }

    /// 带圆角的图片视图(可附加边框border)
    func set(text: String?, font: UIFont?, textColor: UIColor, alignment: NSTextAlignment = .left) -> Void {
        self.text = text
        self.font = font
        self.textColor = textColor
        self.textAlignment = alignment
    }

}
