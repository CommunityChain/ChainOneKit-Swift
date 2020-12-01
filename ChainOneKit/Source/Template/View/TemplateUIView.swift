//
//  TemplateUIView.swift
//  SwiftKit-XiaoDe
//
//  Created by 小唐 on 13/02/2018.
//  Copyright © 2018 ChainOne. All rights reserved.
//
//  UIView 的使用模板

import UIKit

protocol TemplateUIViewProtocol: class {
    
    ///
    func templateView(_ templateView: TemplateUIView, didClickedDone doneView: UIButton) -> Void
    
}

///
class TemplateUIView: UIView {
    
    // MARK: - Internal Property
    
    var model: String? {
        didSet {
            self.setupWithModel(model)
        }
    }

    /// 回调处理
    weak var delegate: TemplateUIViewProtocol?
    var doneClickAction: ((_ templateView: TemplateUIView, _ doneView: UIButton) -> Void)?
    
    
    // MARK: - Private Property
    
    fileprivate let mainView: UIView = UIView.init()
    fileprivate let iconView: UIImageView = UIImageView.init()
    fileprivate let titleLabel: UILabel = UILabel.init()
    fileprivate let detailLabel: UILabel = UILabel.init()
    fileprivate let doneBtn: UIButton = UIButton.init(type: .custom)
    
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
        self.commonInit()
        //fatalError("init(coder:) has not been implemented")
    }
    
    /// 通用初始化：UI、配置、数据等
    func commonInit() -> Void {
        self.initialUI()
    }
    
}

// MARK: - Internal Function
extension TemplateUIView {

    class func loadXib() -> TemplateUIView? {
        return Bundle.main.loadNibNamed("TemplateUIView", owner: nil, options: nil)?.first as? TemplateUIView
    }

}

// MARK: - LifeCircle/Override Function
extension TemplateUIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialInAwakeNib()
    }
    
    /// 布局子控件
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
}
// MARK: - UI Function
extension TemplateUIView {
    
    /// 界面布局
    fileprivate func initialUI() -> Void {
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
extension TemplateUIView {

    /// awakeNib时的处理
    fileprivate func initialInAwakeNib() -> Void {
        
    }

}

// MARK: - Data Function
extension TemplateUIView {

    ///
    fileprivate func setupAsDemo() -> Void {
        self.iconView.backgroundColor = UIColor.red
        self.titleLabel.text = "我是标题"
    }
    /// 数据加载
    fileprivate func setupWithModel(_ model: String?) -> Void {
        self.setupAsDemo()
        guard let _ = model else {
            return
        }
        // 子控件数据加载
    }
    
}

// MARK: - Event Function
extension TemplateUIView {

    //
    @objc fileprivate func doneBtnClick(_ doneBtn: UIButton) -> Void {
        print("TemplateUIView doneBtnClick")
        guard let model = self.model else {
            return
        }
        self.delegate?.templateView(self, didClickedDone: doneBtn)
        self.doneClickAction?(self, doneBtn)
    }

}

// MARK: - Notification Function
extension TemplateUIView {
    
}

// MARK: - Extension Function
extension TemplateUIView {
    
}

// MARK: - Delegate Function

// MARK: - <XXXDelegate>
extension TemplateUIView {
    
}

