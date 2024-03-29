//
//  Constant.swift
//  ChainOneKit
//
//  Created by 小唐 on 2019/1/10.
//  Copyright © 2019 ChainOne. All rights reserved.
//
//  常量

import Foundation
import UIKit

// MARK: - UserInterfacePrinciples

public struct ScreenSize {
    public static let width: CGFloat = UIScreen.main.bounds.size.width
    public static let height: CGFloat = UIScreen.main.bounds.size.height
    public static let maxlength: CGFloat = max(ScreenSize.width, ScreenSize.height)
}

public let kScreenWidth: CGFloat = UIScreen.main.bounds.size.width
public let kScreenHeight: CGFloat = UIScreen.main.bounds.size.height

public let kStatusBarHeight: CGFloat = UIDevice.current.isiPhoneXSeries() ? 44 : 20
public let kNavigationBarHeight: CGFloat = 44
public let kNavigationStatusBarHeight: CGFloat = UIDevice.current.isiPhoneXSeries() ? 88 : 64
/// 注：iPhoneX系列下tabbar的高度83实际上是计算了kBottomHeight，因此高度计算时需注意这个高度问题
public let kTabBarHeight: CGFloat = UIDevice.current.isiPhoneXSeries() ? 83 : 49
public let kBottomHeight: CGFloat = UIDevice.current.isiPhoneXSeries() ? 34 : 0
