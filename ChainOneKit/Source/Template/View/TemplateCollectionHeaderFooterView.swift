//
//  TemplateCollectionReusableView.swift
//  SwiftKit-XiaoDe
//
//  Created by 小唐 on 13/02/2018.
//  Copyright © 2018 ChainOne. All rights reserved.
//
//  UICollectionReusableView 的使用模板
//  用于UICollectionView的SectionHeader和SectionFooter

import UIKit

class TemplateCollectionReusableView: UICollectionReusableView {
    
    // MARK: - Internal Property
    
    static let headerHeight: CGFloat = 32
    static let identifier: String = "TemplateCollectionReusableViewReusableIdentifier"
    
    var model: String? {
        didSet {
            self.setupModel(model)
        }
    }
    
    // MARK: - Private Property
    
    fileprivate let mainView: UIView = UIView()
    
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
extension TemplateCollectionReusableView {
    class func headerInCollectionView(_ collectionView: UICollectionView, at indexPath: IndexPath, of kind: String) -> TemplateCollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: TemplateCollectionReusableView.identifier, for: indexPath)
        (header as! TemplateCollectionReusableView).resetSelf()
        return header as! TemplateCollectionReusableView
    }
    
    class func loadXib() -> TemplateCollectionReusableView? {
        return Bundle.main.loadNibNamed("TemplateCollectionReusableView", owner: nil, options: nil)?.first as? TemplateCollectionReusableView
    }
}

// MARK: - LifeCircle Function
extension TemplateCollectionReusableView {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialInAwakeNib()
    }
}
// MARK: - Private UI 手动布局
extension TemplateCollectionReusableView {
    
    /// 界面布局
    fileprivate func initialUI() -> Void {
        self.addSubview(self.mainView)
        self.initialMainView(self.mainView)
        //self.mainView.snp.makeConstraints { (make) in
        //    make.edges.equalToSuperview()
        //}
    }
    fileprivate func initialMainView(_ mainView: UIView) -> Void {
        mainView.backgroundColor = UIColor.lightGray
    }
    
}
// MARK: - Private UI Xib加载后处理
extension TemplateCollectionReusableView {
    /// awakeNib时的处理
    fileprivate func initialInAwakeNib() -> Void {
        
    }
}

// MARK: - Data Function
extension TemplateCollectionReusableView {
    /// 数据重置
    fileprivate func resetSelf() -> Void {
        
    }
    
    fileprivate func setupModel(_ model: String?) -> Void {
        
    }
}

// MARK: - Event Function
extension TemplateCollectionReusableView {
    
}

// MARK: - Extension Function
