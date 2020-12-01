//
//  NSAttributedString+Extension.swift
//  ChainOneKit
//
//  Created by 小唐 on 2019/2/28.
//  Copyright © 2019 ChainOne. All rights reserved.
//
//  NSAttributedString的扩展库

import Foundation
import UIKit

public extension NSAttributedString {

    /// 文字元祖属性元组数组
    class func textAttTuples() -> [(str: String, font: UIFont, color: UIColor)] {
        let textAttTuples: [(str: String, font: UIFont, color: UIColor)] = []
        return textAttTuples
    }

    /// 快捷属性
    class func attribute(str: String, font: UIFont, color: UIColor) -> NSAttributedString {
        let attText: NSAttributedString = NSAttributedString.init(string: str, attributes: [NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: color])
        return attText
    }
    class func attribute(_ atts: [(str: String, font: UIFont, color: UIColor)]) -> NSAttributedString {
        let mutableAtt: NSMutableAttributedString = NSMutableAttributedString.mutableAttribute(atts)
        let attText: NSAttributedString = NSAttributedString.init(attributedString: mutableAtt)
        return attText
    }
    
}
