//
//  TemplateUITableHeaderFooterView.swift
//  SwiftKit-XiaoDe
//
//  Created by 小唐 on 13/02/2018.
//  Copyright © 2018 ChainOne. All rights reserved.
//
//  UITableViewHeaderFooterView 的使用模板

import UIKit

/// TemplateTableSectionHeaderFooterView
///  UITableViewHeaderFooterView 的使用模板
class TemplateUITableHeaderFooterView: UITableViewHeaderFooterView
{
    
    // MARK: - Internal Property

    static let headerHeight: CGFloat = 75
    static let identifier: String = "TemplateUITableHeaderFooterViewReuseIdentifier"
    
    var title: String? = nil {
        didSet {
            self.titleLabel.text = title
        }
    }
    
    // MARK: - Private Property
    
    fileprivate let titleLabel: UILabel = UILabel.init()

    fileprivate let lrMargin: CGFloat = 12
    
    // MARK: - Initialize Function
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
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
extension TemplateUITableHeaderFooterView {

    /// 便利构造
    class func headerInTableView(_ tableView: UITableView) -> TemplateUITableHeaderFooterView {
        let identifier = self.identifier
        var headerFooterView = tableView.dequeueReusableHeaderFooterView(withIdentifier: identifier)
        if nil == headerFooterView {
            headerFooterView = TemplateUITableHeaderFooterView.init(reuseIdentifier: identifier)
        }
        // 状态重置
        if let headerFooterView = headerFooterView as? TemplateUITableHeaderFooterView {
            headerFooterView.resetSelf()
        }
        return headerFooterView as! TemplateUITableHeaderFooterView
    }

}

// MARK: - Override/LifeCycle Function
extension TemplateUITableHeaderFooterView {

}

// MARK: - UI
extension TemplateUITableHeaderFooterView {

    /// 界面布局
    fileprivate func initialUI() -> Void {
        // 1. titleLabel
        self.contentView.addSubview(self.titleLabel)
        self.titleLabel.set(text: nil, font: UIFont.systemFont(ofSize: 16), textColor: UIColor.init(hex: 0x333333))
        //self.titleLabel.snp.makeConstraints { (make) in
        //    make.leading.equalToSuperview().offset(self.lrMargin)
        //    make.centerY.equalToSuperview()
        //}
    }

}

// MARK: - Data
extension TemplateUITableHeaderFooterView {

    /// 重置
    fileprivate func resetSelf() -> Void {
        self.titleLabel.text = nil
    }

}

// MARK: - Event
extension TemplateUITableHeaderFooterView {
    
}

// MARK: - Notification

// MARK: - Delegate
