//
//  TemplateCollectionViewCell.swift
//  SwiftKit-XiaoDe
//
//  Created by 小唐 on 13/02/2018.
//  Copyright © 2018 ChainOne. All rights reserved.
//
//  UICollectionViewCell 的使用模板

import UIKit

///  UICollectionViewCell 的使用模板
class TemplateUICollectionViewCell: UICollectionViewCell {
    
    // MARK: - Internal Property
    
    static let identifier: String = "TemplateUICollectionViewCellReuseIdentifier"
    
    var model: String? {
        didSet {
            self.setupWithModel(model)
        }
    }
    
    // MARK: - Private Property
    
    fileprivate let mainView: UIView = UIView.init()

    fileprivate let titleLabel: UILabel = UILabel.init()
    fileprivate let detailLabel: UILabel = UILabel.init()
    fileprivate let accessoryView: UIImageView = UIImageView.init()
    fileprivate let bottomLine: UIView = UIView.init()
    
    fileprivate let lrMargin: CGFloat = 12
    fileprivate let detailLeftMargin: CGFloat = 100
    fileprivate let accessorySize: CGSize = CGSize.init(width: 20, height: 20)

    
    // MARK: - Initialize Function
    init() {
        super.init(frame: CGRect.zero)
        self.commonInit()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }
    
    /// 通用初始化
    func commonInit() -> Void {
        self.initialUI()
    }
    
}

// MARK: - Internal Function
extension TemplateUICollectionViewCell {

    class func cellInCollectionView(_ collectionView: UICollectionView, at indexPath: IndexPath) -> TemplateUICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.identifier, for: indexPath)
        (cell as! TemplateUICollectionViewCell).resetSelf()
        return cell as! TemplateUICollectionViewCell
    }
    
}

// MARK: - LifeCircle Function
extension TemplateUICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialInAwakeNib()
    }

}
// MARK: - Private UI 手动布局
extension TemplateUICollectionViewCell {
    
    /// 界面布局
    fileprivate func initialUI() -> Void {
        self.contentView.backgroundColor = UIColor.white
        // mainView
        self.addSubview(self.mainView)
        self.initialMainView(self.mainView)
//        self.mainView.snp.makeConstraints { (make) in
//            make.edges.equalToSuperview()
//        }
    }
    /// mainView布局
    fileprivate func initialMainView(_ mainView: UIView) -> Void {
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
        // 3. accessoryView
        mainView.addSubview(self.accessoryView)
        self.accessoryView.set(cornerRadius: 0)
        self.accessoryView.image = UIImage.init(named: "")
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
// MARK: - Private UI Xib加载后处理
extension TemplateUICollectionViewCell {

    /// awakeNib时的处理
    fileprivate func initialInAwakeNib() -> Void {
        
    }

}

// MARK: - Data Function
extension TemplateUICollectionViewCell {

    ///
    fileprivate func resetSelf() -> Void {
        self.isSelected = false
        self.titleLabel.text = nil
        self.detailLabel.text = nil
        //self.accessoryView.image = nil
    }
    /// 数据加载
    fileprivate func setupWithModel(_ model: String?) -> Void {
        self.setupAsDemo()
        guard let _ = model else {
            return
        }
        /// 控件加载数据
    }
    ///
    fileprivate func setupAsDemo() -> Void {
        self.titleLabel.text = "我是标题"
        self.detailLabel.text = "我是详情"
    }

}

// MARK: - Event Function

// MARK: - Extension Function

// MARK: - <>



