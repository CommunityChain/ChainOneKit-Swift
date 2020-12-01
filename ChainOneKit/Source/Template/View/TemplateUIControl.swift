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

///
class TemplateUIControl: UIControl
{
    
    // MARK: - Internal Property
    
    static let viewHeight: CGFloat = 56
    
    var model: (icon: UIImage?, title: String)? = nil {
        didSet {
            self.setupWithModel(model)
        }
    }
    
    let titleLabel: UILabel = UILabel()
    let iconView: UIImageView = UIImageView()
    
    // MARK: - Private Property
    
    /// icon.centerX的左侧间距
    fileprivate let iconCenterXLeftMargin: CGFloat = 30
    /// title.left的左侧间距(与父视图)
    fileprivate let titleLeftMargin: CGFloat = 52
    
    
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
extension TemplateUIControl {
    
}

// MARK: - LifeCycle/Override Function
extension TemplateUIControl {
    
}

// MARK: - UI Function
extension TemplateUIControl {

    /// 界面布局
    fileprivate func initialUI() -> Void {
        self.backgroundColor = UIColor.white
        // 1. iconView
        self.addSubview(self.iconView)
        //self.iconView.snp.makeConstraints { (make) in
        //    make.centerY.equalToSuperview()
        //    make.centerX.equalTo(self.snp.leading).offset(self.iconCenterXLeftMargin)
        //}
        // 2. titleLabel
        self.addSubview(self.titleLabel)
        self.titleLabel.set(text: nil, font: UIFont.systemFont(ofSize: 16), textColor: UIColor.darkGray)
        //self.titleLabel.snp.makeConstraints { (make) in
        //    make.centerY.trailing.equalToSuperview()
        //    make.leading.equalToSuperview().offset(self.titleLeftMargin)
        //}
    }

}

// MARK: - Data Function
extension TemplateUIControl {

    /// 数据加载
    fileprivate func setupWithModel(_ model: (icon: UIImage?, title: String)?) -> Void {
        guard let model = model else {
            return
        }
        self.iconView.image = model.icon
        self.titleLabel.text = model.title
    }

}

// MARK: - Event Function

// MARK: - Notification Function

// MARK: - Extension Function

// MARK: - Delegate Function


