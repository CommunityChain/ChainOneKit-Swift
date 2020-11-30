//
//  UIDevice+Extension.swift
//  SwiftKit-XiaoDe
//
//  Created by 小唐 on 20/06/2018.
//  Copyright © 2018 ChainOne. All rights reserved.
//
//  UIDevice的扩展

import Foundation
import UIKit
import LocalAuthentication

/**
 iPhone         屏幕尺寸        机型尺寸     屏幕比例        屏幕分辨率(渲染)          系列
 iPhone5          4.0        320 * 568     1.775          640 * 1136         iPhone5/5c/5s
 iPhone6          4.7        375 * 667     1.7786         750 * 1334          iPhone6/6s/7/7s/8/8s
 iPhone6Plus      5.5        414 * 736     1.7777         1080 * 1920         iPhone6+/6s+/7+/8+
 iPhoneX          5.8        375 * 812     2.165          1125 * 2436         iPhoneX/XS
 iPhoneXR         6.1        414 * 896     2.164          828 * 1792
 iPhoneXMax       6.5        414 * 896                    1242 * 2688
 */

public let kiPhone5ScreenSize: CGSize = CGSize(width: 320, height: 568)
public let kiPhone5ScreenWidth: CGFloat = 320
public let kiPhone5ScreenHeight: CGFloat = 568

public let kiPhone6ScreenSize: CGSize = CGSize(width: 375, height: 667)
public let kiPhone6ScreenWidth: CGFloat = 375
public let kiPhone6ScreenHeight: CGFloat = 667

public let kiPhone6PlusScreenSize: CGSize = CGSize(width: 414, height: 736)
public let kiPhone6PlusScreenWidth: CGFloat = 414
public let kiPhone6PlusScreenHeight: CGFloat = 736

public let kiPhoneXScreenSize: CGSize = CGSize(width: 375, height: 812)
public let kiPhoneXScreenWidth: CGFloat = 375
public let kiPhoneXScreenHeight: CGFloat = 812

public let kiPhoneXRScreenSize: CGSize = CGSize(width: 414, height: 896)
public let kiPhoneXRScreenWidth: CGFloat = 414
public let kiPhoneXRScreenHeight: CGFloat = 896

// MARK: - 机型判断 根据屏蔽尺寸判断/还可以根据命名
public extension UIDevice {

    /// iPhoneX判断
    func isiPhoneX() -> Bool {
        let resultFlag: Bool = UIScreen.main.bounds.size.equalTo(kiPhoneXScreenSize)
        return resultFlag
    }

    /// iPhone5系列判断(320, 568)
    /// iPhone5/5s/5c
    func isiPhone5series() -> Bool {
        let resultFlag: Bool = UIScreen.main.bounds.size.equalTo(kiPhone5ScreenSize)
        return resultFlag
    }

    /// iPhone6系列判断(375, 667)
    /// iPhone6/6s/7/7s/8/8s
    func isiPhone6Series() -> Bool {
        let resultFlag: Bool = UIScreen.main.bounds.size.equalTo(kiPhone6ScreenSize)
        return resultFlag
    }

    /// iPhone6Plus系列判断(414, 736)
    /// iPhone6Plus/6sPlus/7Plus/7sPlus/8Plus/8sPlus
    func isiPhone6PlusSeries() -> Bool {
        let resultFlag: Bool = UIScreen.main.bounds.size.equalTo(kiPhone6PlusScreenSize)
        return resultFlag
    }

    /// iPhoneX屏幕比例系列判断(375, 812)
    func isiPhoneXScreenSeries() -> Bool {
        let resultFlag: Bool = UIScreen.main.bounds.size.equalTo(kiPhoneXScreenSize)
        return resultFlag
    }

    /// iPhoneXR屏幕比例系列判断(414, 896)
    /// iPhoneXR/XMax
    func isiPhoneXRScreenSeries() -> Bool {
        let resultFlag: Bool = UIScreen.main.bounds.size.equalTo(kiPhoneXRScreenSize)
        return resultFlag
    }

    /// iPhoneX系列判断
    /// iPhoneX/XR/XMax - X屏幕系列、XR屏幕系列
    func isiPhoneXSeries() -> Bool {
        let resultFlag: Bool = self.isiPhoneXScreenSeries() || self.isiPhoneXRScreenSeries()
        return resultFlag
    }

}

// MARK: - 屏幕比例判断
public extension UIDevice {

    /// iPhone5的屏幕比例 - 1.775
    static let iPhone5ScreenScale: CGFloat = CGFloat(kiPhone5ScreenHeight) / CGFloat(kiPhone5ScreenWidth)
    /// iPhoneX的屏幕比例 - 2.165
    static let iPhoneXScreenScale: CGFloat = CGFloat(kiPhoneXScreenHeight) / CGFloat(kiPhoneXScreenWidth)

    /// iPhone5系列的屏幕比例 - 1.775左右
    func isiPhone5SeriesScreenScale() -> Bool {
        let resultFlag: Bool = self.isiPhone5series() || self.isiPhone6Series() || self.isiPhone6PlusSeries()
        return resultFlag
    }
    /// iPhoneX系列的屏幕比例 - 2.165左右
    func isiPhoneXSeriesScreenScale() -> Bool {
        let resultFlag: Bool = self.isiPhoneXScreenSeries() || self.isiPhoneXRScreenSeries()
        return resultFlag
    }

}

// MARK: - 设备支持判断
public extension UIDevice {

    // MARK: - touchID
    func isSupportTouchID() -> Bool {
        let context = LAContext()
        var error: NSError?
        return context.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: &error)
    }

}
