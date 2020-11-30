//
//  TemplateUITableViewCell.swift
//  SwiftKit-XiaoDe
//
//  Created by 小唐 on 13/02/2018.
//  Copyright © 2018 ChainOne. All rights reserved.
//
//  UITableViewCell的使用模板

import UIKit

/// UITableViewCell的使用模板
class TemplateUITableViewCell: UITableViewCell
{
    
    // MARK: - Internal Property

    static let cellHeight: CGFloat = 75
    /// 重用标识符
    static let identifier: String = "TemplateUITableViewCellReuseIdentifier"
    
    var indexPath: IndexPath?
    var model: String? {
        didSet {
            self.setupWithModel(model)
        }
    }
    
    var showBottomLine: Bool = true {
        didSet {
            self.bottomLine.isHidden = !showBottomLine
        }
    }
    var showTopMargin: Bool = false {
        didSet {
            self.setupShowTopMargin(showTopMargin)
        }
    }
    var showBottomMargin: Bool = true {
        didSet {
            self.setupShowBottomMargin(showBottomMargin)
        }
    }


    // MARK: - fileprivate Property
    
    fileprivate let mainView: UIView = UIView()
    fileprivate let bottomLine: UIView = UIView()
    
    fileprivate let titleLabel: UILabel = UILabel.init()
    fileprivate let detailLabel: UILabel = UILabel.init()
    fileprivate let moreView: UIImageView = UIImageView.init()
    
    fileprivate let topSeparateMargin: CGFloat = 5      // 顶部间距，多用于分组首个cell时的间距展示；
    fileprivate let bottomSeparateMargin: CGFloat = 5   // 底部间距
    fileprivate let lrMargin: CGFloat = 12
    fileprivate let detailLeftMargin: CGFloat = 100
    
    
    // MARK: - Initialize Function
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
extension TemplateUITableViewCell {

    /// 便利构造方法
    class func cellInTableView(_ tableView: UITableView, at indexPath: IndexPath? = nil) -> TemplateUITableViewCell {
        let identifier = TemplateUITableViewCell.identifier
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if nil == cell {
            cell = TemplateUITableViewCell.init(style: .default, reuseIdentifier: identifier)
        }
        // 状态重置
        if let cell = cell as? TemplateUITableViewCell {
            cell.resetSelf()
            cell.indexPath = indexPath
        }
        return cell as! TemplateUITableViewCell
    }

}

// MARK: - Override Function
extension TemplateUITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}

// MARK: - UI 界面布局
extension TemplateUITableViewCell {

    // 界面布局
    fileprivate func initialUI() -> Void {
        //self.contentView.backgroundColor = UIColor.white
        // mainView - 整体布局，便于扩展，特别是针对分割、背景色、四周间距
        self.contentView.addSubview(mainView)
        self.initialMainView(self.mainView)
//        mainView.snp.makeConstraints { (make) in
//            make.leading.trailing.equalToSuperview()
//            make.top.equalToSuperview().offset(0)
//            make.bottom.equalToSuperview().offset(-self.bottomSeparateMargin)
//        }
    }
    // 主视图布局
    fileprivate func initialMainView(_ mainView: UIView) -> Void {
        mainView.backgroundColor = UIColor.white
        // 1. titleLabel
        mainView.addSubview(self.titleLabel)
        self.titleLabel.set(text: nil, font: UIFont.systemFont(ofSize: 14), textColor: UIColor.init(hex: 0x333333))
        //self.titleLabel.snp.makeConstraints { (make) in
        //    make.leading.equalToSuperview().offset(self.lrMargin)
        //    make.centerY.equalToSuperview()
        //}
        // 2. detailLabel
        mainView.addSubview(self.detailLabel)
        self.detailLabel.set(text: nil, font: UIFont.systemFont(ofSize: 12), textColor: UIColor.init(hex: 0x666666))
        //self.detailLabel.snp.makeConstraints { (make) in
        //    make.leading.equalToSuperview().offset(self.detailLeftMargin)
        //    make.centerY.equalToSuperview()
        //}
        // 3. moreView
        mainView.addSubview(self.moreView)
        self.moreView.set(cornerRadius: 0)
        self.moreView.image = UIImage.init(named: "")
        //self.accessoryView.snp.makeConstraints { (make) in
        //    make.trailing.equalToSuperview().offset(-self.lrMargin)
        //    make.centerY.equalToSuperview()
        //}
        // 4. bottomLine
        mainView.addSubview(self.bottomLine)
        self.bottomLine.backgroundColor = UIColor.init(hex: 0xE2E2E2)
        self.bottomLine.isHidden = true     // 默认隐藏
        //self.bottomLine.snp.makeConstraints { (make) in
        //    make.leading.equalToSuperview().offset(self.lrMargin)
        //    make.trailing.equalToSuperview().offset(-self.lrMargin)
        //    make.bottom.equalToSuperview()
        //    make.height.equalTo(0.5)
        //}
    }

}

// MARK: - Data 数据加载
extension TemplateUITableViewCell {

    /// 顶部间距是否显示
    fileprivate func setupShowTopMargin(_ show: Bool) -> Void {
        //let topMargin: CGFloat = show ? self.topSeparateMargin : 0
        //mainView.snp.updateConstraints { (make) in
        //    make.top.equalToSuperview().offset(topMargin)
        //}
        //self.layoutIfNeeded()
    }
    /// 底部间距是否显示
    fileprivate func setupShowBottomMargin(_ show: Bool) -> Void {
        //let bottomMargin: CGFloat = show ? self.bottomSeparateMargin : 0
        //mainView.snp.updateConstraints { (make) in
        //    make.bottom.equalToSuperview().offset(-bottomMargin)
        //}
        //self.layoutIfNeeded()
    }

    /// 重置
    fileprivate func resetSelf() -> Void {
        self.selectionStyle = .none
        self.isSelected = false
        self.showTopMargin = false
        self.showBottomMargin = true
        self.showBottomLine = true
    }
    /// 数据加载
    fileprivate func setupWithModel(_ model: String?) -> Void {
        self.setupAsDemo()
        guard let _ = model else {
            return
        }
        // 控件加载数据
        
    }
    ///
    fileprivate func setupAsDemo() -> Void {
        self.titleLabel.text = "我是标题"
        self.detailLabel.text = "我是详情"
    }

}

// MARK: - Event  事件响应
extension TemplateUITableViewCell {
    
}

