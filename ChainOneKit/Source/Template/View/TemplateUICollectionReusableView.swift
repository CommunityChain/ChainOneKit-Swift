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
    
    fileprivate let mainView: UIView = UIView()
    fileprivate let titleLabel: UILabel = UILabel.init()
    fileprivate let moreView: UIButton = UIButton.init(type: .custom)
    
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

// MARK: - LifeCircle Function
extension TemplateUICollectionReusableView {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialInAwakeNib()
    }

}
// MARK: - Private UI 手动布局
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
        mainView.backgroundColor = UIColor.lightGray
        // 1. titleLabel
        mainView.addSubview(self.titleLabel)
        self.titleLabel.set(text: nil, font: UIFont.systemFont(ofSize: 14), textColor: UIColor.init(hex: 0x333333))
        //self.titleLabel.snp.makeConstraints { (make) in
        //    make.leading.equalToSuperview().offset(self.lrMargin)
        //    make.centerY.equalToSuperview()
        //}
        // 2. moreView
        mainView.addSubview(self.moreView)
        self.moreView.set(title: "更多", titleColor: UIColor.init(hex: 0x8797AC), for: .normal)
        self.moreView.set(title: "更多", titleColor: UIColor.init(hex: 0x8797AC), for: .highlighted)
        self.moreView.set(font: UIFont.systemFont(ofSize: 12))
        self.moreView.contentHorizontalAlignment = .right
        self.moreView.addTarget(self, action: #selector(moreViewClick(_:)), for: .touchUpInside)
        //self.moreView.snp.makeConstraints { (make) in
        //    make.trailing.equalToSuperview().offset(-self.lrMargin)
        //    make.centerY.equalToSuperview()
        //}
    }
    
}
// MARK: - Private UI Xib加载后处理
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
        self.moreView.setTitle(nil, for: .normal)
    }
    /// 数据加载
    fileprivate func setupModel(_ model: String?) -> Void {
        self.setupAsDemo()
        guard let model = model else {
            return
        }
        // 数据加载
        self.titleLabel.text = model
        self.moreView.setTitle("更多", for: .normal)
    }
    ///
    fileprivate func setupAsDemo() -> Void {
        self.titleLabel.text = "哈哈哈"
        self.moreView.setTitle("更多", for: .normal)
    }

}

// MARK: - Event Function
extension TemplateUICollectionReusableView {

    ///
    @objc fileprivate func moreViewClick(_ moreView: UIButton) -> Void {
        print("TemplateUICollectionReusableView moreViewClick")
        self.delegate?.reusableView(self, didClickedMore: moreView)
        self.moreClickAction?(self, moreView)
    }

}

// MARK: - Extension Function
