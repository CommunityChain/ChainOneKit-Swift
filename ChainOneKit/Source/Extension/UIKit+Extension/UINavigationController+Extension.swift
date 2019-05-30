//
//  UINavigationController+Extension.swift
//  ChainOneKit
//
//  Created by 小唐 on 2019/1/16.
//  Copyright © 2019 ChainOne. All rights reserved.
//
//  UINavigationController的扩展

import Foundation
import UIKit

// MARK: - 阴影 —— 导航栏 底部分割线
public extension UINavigationController {

    /// 隐藏导航栏上的阴影 —— 当前导航控制器
    func hiddenNavBarShadow() -> Void {
        let navigationBar = self.navigationBar
        navigationBar.shadowImage = UIImage()
    }
    /// 显示导航栏上的阴影 —— 当前导航控制器
    func showNavBarShadow(color: UIColor = UIColor(hex: 0xcccccc)) -> Void {
        let navigationBar = self.navigationBar
        navigationBar.shadowImage = UIImage.imageWithColor(color)
    }

    /// 隐藏导航栏上的阴影 —— 所有导航控制器
    public class func hiddenNavBarShadow() -> Void {
        let navigationBar = UINavigationBar.appearance()
        navigationBar.shadowImage = UIImage()
    }
    /// 显示导航栏上的阴影 —— 所有导航控制器
    public class func showNavBarShadow(color: UIColor = UIColor(hex: 0xcccccc)) -> Void {
        let navigationBar = UINavigationBar.appearance()
        navigationBar.shadowImage = UIImage.imageWithColor(color)
    }

}

/// MARK: - 导航栏主题
public extension UINavigationController {
    /// 导航栏主题设置 - 对当前的导航控制器
    func setNavBarTheme(titleFont: UIFont, titleColor: UIColor, tintColor: UIColor, barTintColor: UIColor, isTranslucent: Bool = false, bgImage: UIImage = UIImage(), shadowColor: UIColor = UIColor.clear) -> Void {
        let navigationBar = self.navigationBar
        let navBarTitleAtts = [NSAttributedString.Key.foregroundColor: titleColor, NSAttributedString.Key.font: titleFont]
        navigationBar.titleTextAttributes = navBarTitleAtts
        navigationBar.tintColor = tintColor     // 导航栏主题色 (左右按钮颜色)
        navigationBar.barTintColor = barTintColor // 导航栏背景色
        navigationBar.isTranslucent = isTranslucent
        navigationBar.setBackgroundImage(bgImage, for: UIBarPosition.any, barMetrics: UIBarMetrics.default)
        navigationBar.shadowImage = UIImage.imageWithColor(shadowColor)
    }
    /// 导航栏主题设置 - 对所有的导航控制器
    public class func setNavBarTheme(titleFont: UIFont, titleColor: UIColor, tintColor: UIColor, barTintColor: UIColor, isTranslucent: Bool = false, bgImage: UIImage = UIImage(), shadowColor: UIColor = UIColor.clear) -> Void {
        let navigationBar = UINavigationBar.appearance()
        let navBarTitleAtts = [NSAttributedString.Key.foregroundColor: titleColor, NSAttributedString.Key.font: titleFont]
        navigationBar.titleTextAttributes = navBarTitleAtts
        navigationBar.tintColor = tintColor     // 导航栏主题色 (左右按钮颜色)
        navigationBar.barTintColor = barTintColor // 导航栏背景色
        navigationBar.isTranslucent = isTranslucent
        navigationBar.setBackgroundImage(bgImage, for: UIBarPosition.any, barMetrics: UIBarMetrics.default)
        navigationBar.shadowImage = UIImage.imageWithColor(shadowColor)
    }
}
