//
//  String+Localizable.swift
//  ProjectTemplate
//
//  Created by 小唐 on 2019/5/22.
//  Copyright © 2019 ProjectTemplate. All rights reserved.
//
//  字符串本地化

import Foundation

extension String {
    
    /// 使用Localizable.strings命名时
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    /// 使用自定义的命名时，如Internation.strings时传入Internation
    func localized(tableName: String) -> String {
        return NSLocalizedString(self, tableName: tableName, bundle: Bundle.main, comment: "")
    }
    
}
