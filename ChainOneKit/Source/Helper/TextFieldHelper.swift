//
//  TextFieldHelper.swift
//  ThinkSNS +
//
//  Created by 小唐 on 29/09/2017.
//  Copyright © 2017 ZhiYiCX. All rights reserved.
//
//  UITextField的助手

import Foundation
import UIKit

open class TextFieldHelper {

    // 限制输入框输入长度，用于textField的ValueChanged监听响应
    open class func limitTextField(_ textField: UITextField, withMaxLen maxLen: Int) -> Void {

        if 0 >= maxLen {
            return
        }

        let lang: String? = textField.textInputMode?.primaryLanguage     // 键盘输入模式
        if "zh-Hans" == lang   // 简体中文
        {
            // 获取输入框中的高亮部分
            let markdRange = textField.markedTextRange
            if nil == markdRange  // 不存在高亮
            {
                if let newText = textField.text, newText.count > maxLen {
                    textField.text = newText.subString(location: 0, offset: UInt(maxLen))
                }
            } else {}    // 存在高亮，暂不统计，等确定后再统计
        } else    // 中文之外的输入法则直接对其进行统计限制即可，暂不考虑其他语种
        {
            if let newText = textField.text, newText.count > maxLen {
                textField.text = newText.subString(location: 0, offset: UInt(maxLen))
            }
        }
    }

}
