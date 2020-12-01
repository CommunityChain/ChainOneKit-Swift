//
//  TemplateUITableHeaderFooterView.swift
//  SwiftKit-XiaoDe
//
//  Created by 小唐 on 13/02/2018.
//  Copyright © 2018 ChainOne. All rights reserved.
//
//  UITableViewHeaderFooterView 的使用模板

import UIKit

protocol TemplateUITableHeaderFooterViewProtocol: class {

    /// xxx点击回调
    func templateHeaderFooterView(_ headerFooterView: TemplateUITableHeaderFooterView, didClickMore moreView: UIButton) -> Void

}

typealias TemplateTableSectionHeaderFooterView = TemplateUITableHeaderFooterView
///
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
    
    /// 点击回调
    weak var delegate: TemplateUITableHeaderFooterViewProtocol?
    var moreClickAction: ((_ headerFooterView: TemplateUITableHeaderFooterView, _ moreView: UIButton) -> Void)?


    // MARK: - Private Property
    
    fileprivate let mainView: UIView = UIView.init()
    fileprivate let iconView: UIImageView = UIImageView.init()
    fileprivate let titleLabel: UILabel = UILabel.init()
    fileprivate let detailLabel: UILabel = UILabel.init()
    fileprivate let moreBtn: UIButton = UIButton.init(type: .custom)

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

// MARK: - LifeCycle/Override Function
extension TemplateUITableHeaderFooterView {

}

// MARK: - UI Function
extension TemplateUITableHeaderFooterView {

    /// 界面布局
    fileprivate func initialUI() -> Void {
        self.contentView.addSubview(self.mainView)
        self.initialMainView(self.mainView)
        //self.mainView.snp.makeConstraints { (make) in
        //    make.edges.equalToSuperview()
        //}
    }
    /// mainView布局
    fileprivate func initialMainView(_ mainView: UIView) -> Void {
        mainView.backgroundColor = UIColor.white
        
        //let iconSize: CGSize = CGSize.init(width: 10, height: 10)
        //let iconTitleHorMargin: CGFloat = 10
        //let detailLeftMargin: CGFloat = 100
        //let doneBtnSize: CGSize = CGSize.init(width: 60, height: 30)
        // 1. iconView
        mainView.addSubview(self.iconView)
        self.iconView.set(cornerRadius: 0)
        self.iconView.image = UIImage.init(named: "")
        self.iconView.backgroundColor = UIColor.random
        //self.iconView.snp.makeConstraints { (make) in
        //    make.leading.equalToSuperview().offset(self.lrMargin)
        //    make.centerY.equalToSuperview()
        //    make.size.equalTo(iconSize)
        //}
        // 2. titleLabel
        mainView.addSubview(self.titleLabel)
        self.titleLabel.set(text: nil, font: UIFont.systemFont(ofSize: 14), textColor: UIColor.init(hex: 0x333333))
        //self.titleLabel.snp.makeConstraints { (make) in
        //    make.leading.equalTo(self.iconView.snp.trailing).offset(self.lrMargin)
        //    make.centerY.equalToSuperview()
        //}
        // 3. detailLabel
        mainView.addSubview(self.detailLabel)
        self.detailLabel.set(text: nil, font: UIFont.systemFont(ofSize: 12), textColor: UIColor.init(hex: 0x666666))
        //self.detailLabel.snp.makeConstraints { (make) in
        //    make.leading.equalToSuperview().offset(detailLeftMargin)
        //    make.centerY.equalToSuperview()
        //}
        // 4. moreBtn
        mainView.addSubview(self.moreBtn)
        self.moreBtn.set(title: "更多", titleColor: UIColor.init(hex: 0x333333), for: .normal)
        self.moreBtn.set(title: "更多", titleColor: UIColor.init(hex: 0x333333), for: .highlighted)
        self.moreBtn.set(font: UIFont.systemFont(ofSize: 14), cornerRadius: 5, borderWidth: 1, borderColor: UIColor.init(hex: 0x666666))
        self.moreBtn.addTarget(self, action: #selector(moreBtnClick(_:)), for: .touchUpInside)
        //self.moreBtn.snp.makeConstraints { (make) in
        //    make.trailing.equalToSuperview().offset(-self.lrMargin)
        //    make.centerY.equalToSuperview()
        //    make.size.equalTo(doneBtnSize)
        //}
    }

}

// MARK: - Data Function
extension TemplateUITableHeaderFooterView {

    /// 重置
    fileprivate func resetSelf() -> Void {
        self.titleLabel.text = nil
    }

}

// MARK: - Event Function
extension TemplateUITableHeaderFooterView {

    //
    @objc fileprivate func moreBtnClick(_ doneBtn: UIButton) -> Void {
        print("TemplateUITableHeaderFooterView doneBtnClick")
        self.delegate?.templateHeaderFooterView(self, didClickMore: doneBtn)
        self.moreClickAction?(self, doneBtn)
    }

}

// MARK: - Notification Function

// MARK: - Extension Function

// MARK: - Delegate Function

