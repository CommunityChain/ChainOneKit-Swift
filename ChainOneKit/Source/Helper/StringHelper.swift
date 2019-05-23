//
//  StringHelper.swift
//  LianYouPin
//
//  Created by 小唐 on 2019/4/11.
//  Copyright © 2019 COMC. All rights reserved.
//
//  String 小助手

import Foundation

public class StringHelper {
    
    /// 是否为空
    class func isEmpty(for string: String?) -> Bool {
        guard let string = string else {
            return true
        }
        return string.isEmpty
    }
    
    /// 手机号掩码处理 - 中间4位****处理
    class func phoneMaskProcess(_ phone: String?) -> String? {
        guard var phone = phone, !phone.isEmpty else {
            return nil
        }
        var maskPhone: String? = phone
        if 11 == phone.count {
            // 11 位
            let replaceRange = Range<String.Index>.init(uncheckedBounds: (lower: phone.index(phone.startIndex, offsetBy: 3), upper: phone.index(phone.startIndex, offsetBy: 7)))
            phone.replaceSubrange(replaceRange, with: "****")
            maskPhone = phone
        } else if 11 < phone.count {
            // 超过 11 位 - 前3位 和 最后4位
            let strSuffix = phone.subString(location: UInt(phone.count - 4), length: 4)
            let strPrefix = phone.subString(location: 0, length: 3)
            maskPhone = strPrefix + "****" + strSuffix
        } else if 11 > phone.count {
            // 不足 11 位 - 不予处理
            maskPhone = phone
        }
        return maskPhone
    }
    
}
