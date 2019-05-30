//
//  TemplateControl.swift
//  SwiftKit-XiaoDe
//
//  Created by 小唐 on 13/02/2018.
//  Copyright © 2018 ChainOne. All rights reserved.
//
//  UIControl的使用模板

import Foundation
import UIKit

class TemplateControl: UIControl
{
    
    // MARK: - Internal Property

    static var viewHeight: CGFloat = 44
    
    // MARK: - Private Property
    
    // MARK: - Initialize Function
    
    init() {
        super.init(frame: CGRect.zero)
        self.commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    /// 通用初始化：UI、配置、数据等
    fileprivate func commonInit() -> Void {
        self.initialUI()
    }
}

// MARK: - Internal Function

// MARK: - Override Function

// MARK: - Private  UI
extension TemplateControl {
    /// 界面布局
    fileprivate func initialUI() -> Void {
        
    }
}

// MARK: - Private  数据(处理 与 加载)

// MARK: - Private  事件


