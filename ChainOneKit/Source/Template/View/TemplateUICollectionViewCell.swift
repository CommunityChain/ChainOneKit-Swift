//
//  TemplateCollectionViewCell.swift
//  SwiftKit-XiaoDe
//
//  Created by 小唐 on 13/02/2018.
//  Copyright © 2018 ChainOne. All rights reserved.
//
//  UICollectionViewCell 的使用模板

import UIKit

protocol TemplateUICollectionViewCellProtocol: class {

    /// xxx点击回调
    func templateCell(_ cell: TemplateUICollectionViewCell, didClickDoneView doneView: UIButton) -> Void

}

///
class TemplateUICollectionViewCell: UICollectionViewCell {
    
    // MARK: - Internal Property
    
    static let identifier: String = "TemplateUICollectionViewCellReuseIdentifier"
    
    var model: String? {
        didSet {
            self.setupWithModel(model)
        }
    }
    
    /// 回调
    weak var delegate: TemplateUICollectionViewCellProtocol?
    var doneClickAction: ((_ cell: TemplateUICollectionViewCell, _ doneView: UIButton) -> Void)?

    
    // MARK: - Private Property
    
    fileprivate let mainView: UIView = UIView.init()

    fileprivate let iconView: UIImageView = UIImageView.init()
    fileprivate let titleLabel: UILabel = UILabel.init()
    fileprivate let detailLabel: UILabel = UILabel.init()
    fileprivate let doneBtn: UIButton = UIButton.init(type: .custom)
    fileprivate let bottomLine: UIView = UIView.init()
    
    fileprivate let lrMargin: CGFloat = 12

    
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

    ///
    class func cellInCollectionView(_ collectionView: UICollectionView, at indexPath: IndexPath) -> TemplateUICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.identifier, for: indexPath)
        (cell as! TemplateUICollectionViewCell).resetSelf()
        return cell as! TemplateUICollectionViewCell
    }
    
}

// MARK: - LifeCircle/Override Function
extension TemplateUICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialInAwakeNib()
    }

}
// MARK: - UI Function(手动布局)
extension TemplateUICollectionViewCell {
    
    /// 界面布局
    fileprivate func initialUI() -> Void {
        self.contentView.backgroundColor = UIColor.white
        // mainView
        self.addSubview(self.mainView)
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
        // 4. doneBtn
        mainView.addSubview(self.doneBtn)
        self.doneBtn.set(title: "完成", titleColor: UIColor.init(hex: 0x333333), for: .normal)
        self.doneBtn.set(title: "完成", titleColor: UIColor.init(hex: 0x333333), for: .highlighted)
        self.doneBtn.set(font: UIFont.systemFont(ofSize: 14), cornerRadius: 5, borderWidth: 1, borderColor: UIColor.init(hex: 0x666666))
        self.doneBtn.addTarget(self, action: #selector(doneBtnClick(_:)), for: .touchUpInside)
        //self.doneBtn.snp.makeConstraints { (make) in
        //    make.trailing.equalToSuperview().offset(-self.lrMargin)
        //    make.centerY.equalToSuperview()
        //    make.size.equalTo(doneBtnSize)
        //}
    }
    
}
// MARK: - UI Xib加载后处理
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
    ///
    fileprivate func setupAsDemo() -> Void {
        self.titleLabel.text = "我是标题"
        self.detailLabel.text = "我是详情"
    }
    /// 数据加载
    fileprivate func setupWithModel(_ model: String?) -> Void {
        self.setupAsDemo()
        guard let _ = model else {
            return
        }
        /// 控件加载数据
    }

}

// MARK: - Event Function
extension TemplateUICollectionViewCell {

    //
    @objc fileprivate func doneBtnClick(_ doneBtn: UIButton) -> Void {
        print("TemplateUICollectionViewCell doneBtnClick")
        guard let model = self.model else {
            return
        }
        self.delegate?.templateCell(self, didClickDoneView: doneBtn)
        self.doneClickAction?(self, doneBtn)
    }

}

// MARK: - Notification Function
extension TemplateUICollectionViewCell {

}

// MARK: - Extension Function
extension TemplateUICollectionViewCell {

}

// MARK: - Delegate Function

// MARK: - <XXXDelegate>
extension TemplateUICollectionViewCell {

}


