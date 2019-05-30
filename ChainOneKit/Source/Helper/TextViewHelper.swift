//
//  TextViewHelper.swift
//  ChainOneKit
//
//  Created by 小唐 on 2019/2/20.
//  Copyright © 2019 ChainOne. All rights reserved.
//
//  UITextView的助手

import Foundation
import UIKit

public class TextViewHelper {

    // 限制输入框输入长度，用于textField的ValueChanged监听响应
    public class func limitTextView(_ textView: UITextView, withMaxLen maxLen: Int) -> Void {

        if 0 >= maxLen {
            return
        }

        let lang: String? = textView.textInputMode?.primaryLanguage     // 键盘输入模式
        if "zh-Hans" == lang   // 简体中文
        {
            // 获取输入框中的高亮部分
            let markdRange = textView.markedTextRange
            if nil == markdRange  // 不存在高亮
            {
                if let newText = textView.text, newText.count > maxLen {
                    textView.text = newText.subString(location: 0, offset: UInt(maxLen))
                }
            } else {}    // 存在高亮，暂不统计，等确定后再统计
        } else    // 中文之外的输入法则直接对其进行统计限制即可，暂不考虑其他语种
        {
            if let newText = textView.text, newText.count > maxLen {
                textView.text = newText.subString(location: 0, offset: UInt(maxLen))
            }
        }
    }

}
