//
//  TemplateView.swift
//  SwiftKit-XiaoDe
//
//  Created by 小唐 on 13/02/2018.
//  Copyright © 2018 ChainOne. All rights reserved.
//
//  UIView 的使用模板

import UIKit

///  UIView 的使用模板
class TemplateView: UIView {
    
    // MARK: - Internal Property
    
    // MARK: - Private Property
    
    fileprivate let mainView: UIView = UIView()
    
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
    fileprivate func commonInit() -> Void {
        self.initialUI()
    }
    
}

// MARK: - Internal Function
extension TemplateView {
    class func loadXib() -> TemplateView? {
        return Bundle.main.loadNibNamed("TemplateView", owner: nil, options: nil)?.first as? TemplateView
    }
}

// MARK: - LifeCircle Function
extension TemplateView {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialInAwakeNib()
    }
    
    /// 布局子控件
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
}
// MARK: - Private UI 手动布局
extension TemplateView {
    
    /// 界面布局
    fileprivate func initialUI() -> Void {
        self.addSubview(self.mainView)
        self.initialMainView(self.mainView)
        //self.mainView.snp.makeConstraints { (make) in
        //    make.edges.equalToSuperview()
        //}
    }
    fileprivate func initialMainView(_ mainView: UIView) -> Void {
        
    }
    
}
// MARK: - Private UI Xib加载后处理
extension TemplateView {
    /// awakeNib时的处理
    fileprivate func initialInAwakeNib() -> Void {
        
    }
}

// MARK: - Data Function
extension TemplateView {
    
}

// MARK: - Event Function
extension TemplateView {
    
}

// MARK: - Extension Function
extension TemplateView {
    
}

// MARK: - Delegate Function

// MARK: - <XXXDelegate>
extension TemplateView {
    
}


