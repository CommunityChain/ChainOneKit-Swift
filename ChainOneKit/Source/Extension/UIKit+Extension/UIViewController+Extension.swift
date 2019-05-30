//
//  Created by 小唐 on 05/06/2018.
//  Copyright (c) 2018 ChainOne. All rights reserved.
//
//  UIViewController的扩展

import Foundation
import UIKit

public extension UIViewController {
    /// 通过控制器名字构建控制器
    static func controllerWithName(_ name: String) -> UIViewController {
        // 1. Swift中新增了命名空间，通过字符串创建控制器需要带上命名空间
        // 2. 通过命名空间和类名转换成类别AnyClass，把转换成的类别转化为对应类UIViewController
        // CFBundleExecutable / CFBundleName
        guard let namespace = Bundle.main.infoDictionary?["CFBundleExecutable"] as? String,
              let vcClassType = NSClassFromString(namespace + "." + name) as? UIViewController.Type  else {
            fatalError("通过控制器名\(name)构建控制器异常")
        }
        return  vcClassType.init()
    }
}
