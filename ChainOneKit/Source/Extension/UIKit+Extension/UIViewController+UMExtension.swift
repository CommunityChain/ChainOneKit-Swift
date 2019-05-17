//
//  UIViewController+UMExtension.swift
//  SwiftKit-XiaoDe
//
//  Created by 小唐 on 26/03/2018.
//  Copyright © 2018 TangXiaoDe. All rights reserved.
//
//  UIViewcontroller里增加UM的的页面统计

/**
 
 UM页面统计方案
 
    基类继承方案
    UIViewcontroller扩展方案
 
 新需求：部分页面是控制器内部嵌套完成的，特别是可以滚动的页面，随着滚动而不断增加
 
 **/

import Foundation
import UIKit

/// 如果控制器名中含有该内容，则放弃统计该页面，会重新赋值，取"Bundle.main.bundlePath"
fileprivate var bundleName: String = ""

public extension DispatchQueue {

    private static var _onceTracker = [String]()

    class func once(token: String, block:() -> Void) {
        objc_sync_enter(self)
        defer { objc_sync_exit(self) }
        if _onceTracker.contains(token) {
            return
        }
        _onceTracker.append(token)
        block()
    }

}

//extension UIViewController {
//
//    open override static func initialize() {
//        struct Static {
//            static var token: String = "com.tokenbook.VCExtension"
//        }
//        // 确保不是子类
//        if self !== UIViewController.self {
//            return
//        }
//
//        DispatchQueue.once(token: Static.token, block: {
//            var bundlePath = Bundle.main.bundlePath
//            bundlePath = bundlePath.components(separatedBy: "/").last!
//            bundlePath = bundlePath.components(separatedBy: ".").first!
//            bundleName = bundlePath
//
//            let originalSelector = #selector(UIViewController.viewWillAppear(_:))
//            let swizzledSelector = #selector(newViewWillAppear(animated:))
//            let originalSelector1 = #selector(UIViewController.viewWillDisappear(_:))
//            let swizzledSelector1 = #selector(newViewWillDisappear(animated:))
//
//            let originalMethod = class_getInstanceMethod(self, originalSelector)
//            let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)
//            let originalMethod1 = class_getInstanceMethod(self, originalSelector1)
//            let swizzledMethod1 = class_getInstanceMethod(self, swizzledSelector1)
//
//            let didAddMethod = class_addMethod(self, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
//            let didAddMethod1 = class_addMethod(self, originalSelector1, method_getImplementation(swizzledMethod1), method_getTypeEncoding(swizzledMethod1))
//
//            if didAddMethod {
//                class_replaceMethod(self, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
//            } else {
//                method_exchangeImplementations(originalMethod, swizzledMethod);
//            }
//
//            if didAddMethod1 {
//                class_replaceMethod(self, swizzledSelector1, method_getImplementation(originalMethod1), method_getTypeEncoding(originalMethod1))
//            } else {
//                method_exchangeImplementations(originalMethod1, swizzledMethod1);
//            }
//
//        })
//
//    }
//
//    // MARK: - Method Swizzling
//
//    @objc func newViewWillAppear(animated:Bool) {
//        if self.isBaseNavigationController || self.isBaseTabBarController || !String(describing:self.self).contains(bundleName) {
//        } else {
//            MobClick.beginLogPageView(String(describing: self.self))
//            print(String(describing: self.self) + " viewWillAppear")
//        }
//
//        self.newViewWillAppear(animated: animated)
//    }
//
//    @objc func newViewWillDisappear(animated:Bool) {
//        if self.isBaseNavigationController || self.isBaseTabBarController || !String(describing:self.self).contains(bundleName) {
//        } else {
//            MobClick.endLogPageView(String(describing: self.self))
//            print(String(describing: self.self) + " viewWillDisappear")
//        }
//
//        self.newViewWillDisappear(animated: animated)
//    }
//
//    var isBaseNavigationController: Bool {
//        return self.isKind(of: UINavigationController.self)
//    }
//    var isBaseTabBarController: Bool {
//        return self.isKind(of: UITabBarController.self)
//    }
//
//
//}

// MARK: - 基类继承方案

/**

class TSViewController: UIViewController {
    
    /// 该页面是否参与UM的统计，为控制器嵌套时设计，避免重复统计。
    var isUMCount: Bool = true
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(String(describing: self.self) + " viewWillAppear")
        if self.isUMCount {
            MobClick.beginLogPageView(String(describing: self.self))
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(String(describing: self.self) + " viewWillDisappear")
        if self.isUMCount {
            MobClick.endLogPageView(String(describing: self.self))
        }
    }
    
    deinit {
        // 查看与统计页面销毁，避免内存泄露
        print(String(describing: self.self) + " deninit")
    }

}


**/
