//
//  String+Regular.swift
//  LianYouPin
//
//  Created by 小唐 on 2019/4/25.
//  Copyright © 2019 COMC. All rights reserved.
//
//  String的正则表达式相关扩展

import Foundation

// MARK: - 正则表达式判断
public extension String {
    /// 正则匹配判断
    func isMatchRegex(_ strRegex: String) -> Bool {
        //let predicate = NSPredicate(format: "SELF MATCHES %@", strRegex)
        //return predicate.evaluate(with: self)
        let regex = try! NSRegularExpression(pattern: strRegex, options: [])
        let matchs = regex.matches(in: self, options: [], range: NSRange(location: 0, length: self.count))
        if matchs.isEmpty {
            return false // 未检索到合法字段
        } else {
            return true // 检索到合法字段
        }
    }
}


// MARK: - 正则表达式应用
public extension String {
    /// 正则匹配判断
    func isPhoneNum() -> Bool {
        // "^1([0-9]{10})$"
        let strRegex: String = "^1\\d{10}$"
        return self.isMatchRegex(strRegex)
    }
}
