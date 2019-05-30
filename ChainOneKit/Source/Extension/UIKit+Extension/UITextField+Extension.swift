//
//  UITextField+Extension.swift
//  ChainOneKit
//
//  Created by 小唐 on 2019/2/20.
//  Copyright © 2019 ChainOne. All rights reserved.
//
//  UITextField的扩展

import Foundation
import UIKit

public extension UITextField {

    convenience init(placeHolder: String?, text: String? = nil, font: UIFont, textColor: UIColor, alignment: NSTextAlignment = .left) {
        self.init(frame: CGRect.zero)
        self.placeholder = placeHolder
        self.textColor = textColor
        self.font = font
        self.text = text
        self.textAlignment = alignment
    }

    func set(placeHolder: String?, text: String? = nil, font: UIFont?, textColor: UIColor, alignment: NSTextAlignment = .left) -> Void {
        self.placeholder = placeHolder
        self.text = text
        self.font = font
        self.textColor = textColor
        self.textAlignment = alignment
    }

}
