//
//  TemplateTableViewCell.swift
//  SwiftKit-XiaoDe
//
//  Created by 小唐 on 13/02/2018.
//  Copyright © 2018 ChainOne. All rights reserved.
//
//  UITableViewCell的使用模板

import UIKit

/// UITableViewCell的使用模板
class TemplateTableViewCell: UITableViewCell
{
    
    // MARK: - Internal Property
    static let cellHeight: CGFloat = 75
    /// 重用标识符
    static let identifier: String = "TemplateTableViewCellReuseIdentifier"
    
    var model: String? {
        didSet {
            self.setupWithModel(model)
        }
    }
    
    // MARK: - fileprivate Property
    
    fileprivate let mainView: UIView = UIView()
    
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
extension TemplateTableViewCell {
    /// 便利构造方法
    class func cellInTableView(_ tableView: UITableView) -> TemplateTableViewCell {
        let identifier = TemplateTableViewCell.identifier
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if nil == cell {
            cell = TemplateTableViewCell.init(style: .default, reuseIdentifier: identifier)
        }
        // 状态重置
        if let cell = cell as? TemplateTableViewCell {
            cell.resetSelf()
        }
        return cell as! TemplateTableViewCell
    }
}

// MARK: - Override Function
extension TemplateTableViewCell {
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
extension TemplateTableViewCell {
    // 界面布局
    fileprivate func initialUI() -> Void {
        // mainView - 整体布局，便于扩展，特别是针对分割、背景色、四周间距
        self.contentView.addSubview(mainView)
        self.initialMainView(self.mainView)
//        mainView.snp.makeConstraints { (make) in
//            make.edges.equalToSuperview()
//        }
    }
    // 主视图布局
    fileprivate func initialMainView(_ mainView: UIView) -> Void {
        mainView.backgroundColor = UIColor.white
    }
}

// MARK: - Data 数据加载
extension TemplateTableViewCell {
    /// 重置
    fileprivate func resetSelf() -> Void {
        self.selectionStyle = .none
    }
    /// 数据加载
    fileprivate func setupWithModel(_ model: String?) -> Void {
        guard let _ = model else {
            return
        }
        
    }
}

// MARK: - Event  事件响应
extension TemplateTableViewCell {
    
}

