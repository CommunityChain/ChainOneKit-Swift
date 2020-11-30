//
//  TemplateUIView.swift
//  SwiftKit-XiaoDe
//
//  Created by 小唐 on 13/02/2018.
//  Copyright © 2018 ChainOne. All rights reserved.
//
//  UIView 的使用模板

import UIKit

///  UIView 的使用模板
class TemplateUIView: UIView {
    
    // MARK: - Internal Property
    
    var model: String? {
        didSet {
            self.setupWithModel(model)
        }
    }
    
    
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

// MARK: - LifeCircle Function
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
// MARK: - Private UI 手动布局
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
        
    }
    
}
// MARK: - Private UI Xib加载后处理
extension TemplateUIView {

    /// awakeNib时的处理
    fileprivate func initialInAwakeNib() -> Void {
        
    }

}

// MARK: - Data Function
extension TemplateUIView {
    ///
    fileprivate func setupAsDemo() -> Void {
        
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
    
}

// MARK: - Extension Function
extension TemplateUIView {
    
}

// MARK: - Delegate Function

// MARK: - <XXXDelegate>
extension TemplateUIView {
    
}


