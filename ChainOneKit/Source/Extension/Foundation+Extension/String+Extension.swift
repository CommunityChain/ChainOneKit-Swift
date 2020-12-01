//
//  String+Extension.swift
//  SwiftKit-XiaoDe
//
//  Created by 小唐 on 25/06/2018.
//  Copyright © 2018 ChainOne. All rights reserved.
//
//  String的扩展

import Foundation
import UIKit

public extension String {

    func size(maxSize: CGSize, font: UIFont, lineMargin: CGFloat = 0) -> CGSize {
        let options: NSStringDrawingOptions = NSStringDrawingOptions.usesLineFragmentOrigin
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineMargin // 行间距
        var attributes: [NSAttributedString.Key: Any] = [:]
        attributes[NSAttributedString.Key.font] = font
        attributes[NSAttributedString.Key.paragraphStyle] = paragraphStyle
        let str = self as NSString
        let textBounds = str.boundingRect(with: maxSize, options: options, attributes: attributes, context: nil)
        return textBounds.size
    }

}

// MARK: - 字符串裁剪
public extension String {

    /// 裁切字段
    func subString(with range: NSRange) -> String {
        // 注：如果 range.location + range.length > self.count 时，会崩溃
        let newRange = self.index(self.startIndex, offsetBy: range.location) ..< self.index(self.startIndex, offsetBy: range.location + range.length)
        return String(self[newRange])
    }
    /// 字符串裁剪
    func subString(location: UInt = 0, length: UInt) -> String {
        // 注：如果 location + length > self.count 时，会崩溃
        let startIndex: String.Index = self.index(self.startIndex, offsetBy: Int(location))
        let endIndex: String.Index = self.index(self.startIndex, offsetBy: Int(location + length))
        return String(self[startIndex ..< endIndex])
    }
    /// 字符串裁剪
    func subString(location: UInt = 0, maxLen: UInt) -> String {
        // 注：解决 location + length > self.count 时崩溃异常
        let startIndex: String.Index = self.index(self.startIndex, offsetBy: Int(location))
        let offset: Int = Int(location + maxLen) <= self.count ? Int(maxLen) : max(self.count - Int(location), 0)
        let endIndex: String.Index = self.index(self.startIndex, offsetBy: Int(location) + offset)
        return String(self[startIndex ..< endIndex])
    }
    /// 重载
    func subString(location: UInt = 0, offset: UInt) -> String {
        return self.subString(location: location, length: offset)
    }
    func subString(nsrange: NSRange) -> String {
        return self.subString(with: nsrange)
    }

    func subString(range: Range<String.Index>) -> String {
        return String(self[range])
    }
    func subString(startIndex: String.Index, endIndex: String.Index) -> String {
        return String(self[startIndex ..< endIndex])
    }

}

public extension String {

    /// 小数处理
    func decimalProcess(digits: Int = 2) -> String {
        if let value =  Double(self) {
            return "\(value.decimalValidDigitsProcess(digits: digits))"
        }
        return "0.00"
    }

}

