//
//  TemplateUICollectionReusableView.swift
//  ChainOneKit-Swift
//
//  Created by 小唐 on 2020/11/30.
//
//  UICollectionReusableView 的使用模板
//  用于UICollectionView的SectionHeader和SectionFooter

import UIKit

protocol TemplateUICollectionReusableViewProtocol: class {

    /// xxx点击回调
    func reusableView(_ reusableView: TemplateUICollectionReusableView, didClickedMore moreView: UIView) -> Void

}

typealias TemplateUICollectionHeaderFooterView = TemplateUICollectionReusableView
///
class TemplateUICollectionReusableView: UICollectionReusableView {
    
    // MARK: - Internal Property
    
    static let headerHeight: CGFloat = 44
    static let identifier: String = "TemplateUICollectionReusableViewReusableIdentifier"
    
    var model: String? {
        didSet {
            self.setupModel(model)
        }
    }
    
    weak var delegate: TemplateUICollectionReusableViewProtocol?
    var moreClickAction: ((_ reusableView: TemplateUICollectionReusableView, _ moreView: UIView) -> Void)?
    
    // MARK: - Private Property
    
    fileprivate let mainView: UIView = UIView.init()
    fileprivate let iconView: UIImageView = UIImageView.init()
    fileprivate let titleLabel: UILabel = UILabel.init()
    fileprivate let detailLabel: UILabel = UILabel.init()
    fileprivate let moreBtn: UIButton = UIButton.init(type: .custom)

    fileprivate let lrMargin: CGFloat = 12
    
    // MARK: - Initialize Function
    init() {
        super.init(frame: CGRect.zero)
        self.initialUI()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialUI()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Internal Function
extension TemplateUICollectionReusableView {

    /// 便利构造
    class func headerInCollectionView(_ collectionView: UICollectionView, at indexPath: IndexPath, of kind: String) -> TemplateUICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: TemplateUICollectionReusableView.identifier, for: indexPath)
        (header as! TemplateUICollectionReusableView).resetSelf()
        return header as! TemplateUICollectionReusableView
    }
    
    class func loadXib() -> TemplateUICollectionReusableView? {
        return Bundle.main.loadNibNamed("TemplateUICollectionReusableView", owner: nil, options: nil)?.first as? TemplateUICollectionReusableView
    }

}

// MARK: - LifeCircle/Override Function
extension TemplateUICollectionReusableView {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialInAwakeNib()
    }

}

// MARK: - UI Function
extension TemplateUICollectionReusableView {
    
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
        //let moreBtnSize: CGSize = CGSize.init(width: 60, height: 30)
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
// MARK: - UI Xib加载后处理
extension TemplateUICollectionReusableView {

    /// awakeNib时的处理
    fileprivate func initialInAwakeNib() -> Void {
        
    }

}

// MARK: - Data Function
extension TemplateUICollectionReusableView {

    /// 数据重置
    fileprivate func resetSelf() -> Void {
        self.titleLabel.text = nil
    }
    ///
    fileprivate func setupAsDemo() -> Void {
        self.iconView.backgroundColor = UIColor.yellow
        self.titleLabel.text = "我是标题"
        self.detailLabel.text = "我是详情"
    }
    /// 数据加载
    fileprivate func setupModel(_ model: String?) -> Void {
        self.setupAsDemo()
        guard let model = model else {
            return
        }
        // 数据加载
        self.titleLabel.text = model
    }

}

// MARK: - Event Function
extension TemplateUICollectionReusableView {

    //
    @objc fileprivate func moreBtnClick(_ moreBtn: UIButton) -> Void {
        print("TemplateUICollectionReusableView moreViewClick")
        self.delegate?.reusableView(self, didClickedMore: moreBtn)
        self.moreClickAction?(self, moreBtn)
    }

}

// MARK: - Notification Function

// MARK: - Extension Function

// MARK: - Delegate Function
