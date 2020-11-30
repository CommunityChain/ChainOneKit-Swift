//
//  UIButton+Extension.swift
//  SwiftKit-XiaoDe
//
//  Created by 小唐 on 13/02/2018.
//  Copyright © 2018 ChainOne. All rights reserved.
//
//  UIButton的扩展

import Foundation
import UIKit

public extension UIButton {

    // 带圆角的图片视图(可附加边框border)
    convenience init(font: UIFont? = nil, cornerRadius: CGFloat = 0, borderWidth: CGFloat = 0, borderColor: UIColor = UIColor.clear) {
        self.init(type: .custom)
        self.set(font: font, cornerRadius: cornerRadius, borderWidth: borderWidth, borderColor: borderColor)
    }
    convenience init(font: UIFont) {
        self.init(type: .custom)
        self.titleLabel?.font = font
    }
    convenience init(cornerRadius: CGFloat) {
        self.init(type: .custom)
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
    }

}

public extension UIButton {

    ///
    func set(title: String?, titleColor: UIColor, image: UIImage? = nil, bgImage: UIImage? = nil, for state: UIControl.State) -> Void {
        self.setTitle(title, for: state)
        self.setTitleColor(titleColor, for: state)
        self.setImage(image, for: state)
        self.setBackgroundImage(bgImage, for: state)
        //let attTitle = NSAttributedString
        //self.setAttributedTitle(attTitle, for: state)
        //let shadowColor: UIColor
        //self.setTitleShadowColor(shadowColor, for: sate)
    }

    /// 
    func set(font: UIFont?, cornerRadius: CGFloat = 0, borderWidth: CGFloat = 0, borderColor: UIColor = UIColor.clear) -> Void {
        if let font = font {
            self.titleLabel?.font = font
        }
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }

}
