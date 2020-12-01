//
//  NSMutableAttributedString+Extension.swift
//  ChainOneKit
//
//  Created by 小唐 on 2019/2/28.
//  Copyright © 2019 ChainOne. All rights reserved.
//
//  NSMutableAttributedString的扩展库

import Foundation
import UIKit

public extension NSMutableAttributedString {

    /// 
    class func attribute(string: String, font: UIFont?, textColor: UIColor?) -> NSMutableAttributedString {
        var attributes: [NSAttributedString.Key : Any] = [:]
        if let font = font {
            attributes[NSAttributedString.Key.font] = font
        }
        if let textColor = textColor {
            attributes[NSAttributedString.Key.foregroundColor] = textColor
        }
        let attText = NSMutableAttributedString.init(string: string, attributes:attributes)
        return attText
    }

    /// 设置文字字体大小
    func setTextFont(_ font: UIFont) -> NSMutableAttributedString {
        let attributeString = self
        attributeString.addAttributes([NSAttributedString.Key.font: font], range: NSRange(location: 0, length: attributeString.length))
        return attributeString
    }

}

public extension NSMutableAttributedString {
    
    /// 快捷属性
    class func mutableAttribute(str: String, font: UIFont, color: UIColor) -> NSMutableAttributedString {
        let attText: NSMutableAttributedString = NSMutableAttributedString.init(string: str, attributes: [NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: color])
        return attText
    }
    class func mutableAttribute(_ atts: [(str: String, font: UIFont, color: UIColor)]) -> NSMutableAttributedString {
        let attText: NSMutableAttributedString = NSMutableAttributedString.init()
        for att in atts {
            let itemAtt = NSAttributedString.init(string: att.str, attributes: [NSAttributedString.Key.font: att.font, NSAttributedString.Key.foregroundColor: att.color])
            attText.append(itemAtt)
        }
        return attText
    }

}
