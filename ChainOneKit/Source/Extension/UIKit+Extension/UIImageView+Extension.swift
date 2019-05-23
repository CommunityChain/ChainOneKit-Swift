//
//  UIImageView+Extension.swift
//  SwiftKit-XiaoDe
//
//  Created by 小唐 on 13/02/2018.
//  Copyright © 2018 TangXiaoDe. All rights reserved.
//
//  UIImageView的扩展

import Foundation
import UIKit

public extension UIImageView {

    /// 带圆角的图片视图(可附加边框border)
    @objc convenience init(cornerRadius: CGFloat, borderWidth: CGFloat = 0, borderColor: UIColor = UIColor.clear) {
        self.init(frame: CGRect.zero)
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        // 图片拉伸样式设置
        self.contentMode = .scaleAspectFill
    }

    /// 带圆角的图片视图(可附加边框border)
    override func set(cornerRadius: CGFloat, borderWidth: CGFloat = 0, borderColor: UIColor = UIColor.clear) -> Void {
        super.set(cornerRadius: cornerRadius, borderWidth: borderWidth, borderColor: borderColor)
        // 图片拉伸样式设置
        self.contentMode = .scaleAspectFill
    }

}
