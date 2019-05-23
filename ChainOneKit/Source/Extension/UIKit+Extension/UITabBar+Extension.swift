//
//  UITabBar+Extension.swift
//  CCMall
//
//  Created by 小唐 on 2019/3/19.
//  Copyright © 2019 COMC. All rights reserved.
//
//  UITabBar的扩展

import Foundation
import UIKit

public extension UITabBar {
    
    /// Title 和 Icon 的间距调整
    func setTitleImageInsets(titlePositionOffset: UIOffset, imageInsets: UIEdgeInsets) -> Void {
        guard let items = self.items else {
            return
        }
        for tabbarItem in items {
            tabbarItem.titlePositionAdjustment = titlePositionOffset
            tabbarItem.imageInsets = imageInsets
        }
    }
    
}
