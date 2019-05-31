//
//  NoHighlightedButton.swift
//  ChainOneKit
//
//  Created by 小唐 on 2019/3/25.
//  Copyright © 2019 ChainOne. All rights reserved.
//
//  禁止高亮的按钮

import UIKit

/// 禁止高亮的按钮/高亮状态不起作用的按钮
class NoHighlightedButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    /// 重写isHighlighted属性的didSet方法，设置父类的isHighlighted属性为false。
    override var isHighlighted: Bool {
        didSet {
            super.isHighlighted = false
        }
    }

}
