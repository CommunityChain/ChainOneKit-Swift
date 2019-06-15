//
//  TemplateAverageWidthTitleView.swift
//  iMeet
//
//  Created by 小唐 on 2019/6/12.
//  Copyright © 2019 ChainOne. All rights reserved.
//
//  均分的标题选择视图控件

import UIKit

protocol TemplateAverageWidthTitleViewProtocol: class {
    func titleView(_ titleView: TemplateAverageWidthTitleView, didClicked title: String, at index: Int) -> Void
}


typealias TemplateAverageWidthTitleSelectView = TemplateAverageWidthTitleView
///
class TemplateAverageWidthTitleView: UIView {
    
    // MARK: - Internal Property
    
    static let viewHeight: CGFloat = 44
    
    /// 当前选中索引，修改请使用setupSelectedIndex方法
    private(set) var selectedIndex: Int = 0
    
    /// 回调
    weak var delegate: TemplateAverageWidthTitleViewProtocol?
    var titleClickAction: ((_ titleView: TemplateAverageWidthTitleView, _ title: String, _ index: Int) -> Void)?
    
    // MARK: - Private Property
    
    fileprivate let mainView: UIView = UIView()
    fileprivate let sliderView: UIView = UIView()
    fileprivate weak var squareBtn: UIButton!
    fileprivate weak var recommendBtn: UIButton!
    fileprivate weak var followBtn: UIButton!
    
    fileprivate let titles: [String] = ["广场", "推荐", "关注"]
    
    fileprivate let sliderViewH: CGFloat = 3
    fileprivate let sliderViewW: CGFloat = 24
    
    fileprivate let titleBtnTagBase: Int = 250
    
    /// 当前选中按钮
    fileprivate var currentSelectedBtn: UIButton?
    
    
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
extension TemplateAverageWidthTitleView {
    class func loadXib() -> TemplateAverageWidthTitleView? {
        return Bundle.main.loadNibNamed("TemplateAverageWidthTitleView", owner: nil, options: nil)?.first as? TemplateAverageWidthTitleView
    }
    
    /// 设置当前选中索引
    func setupSelectedIndex(selectedIndex: Int) -> Void {
        if selectedIndex == self.selectedIndex {
            return
        }
        if let button = self.mainView.viewWithTag(self.titleBtnTagBase + selectedIndex) as? UIButton {
            self.buttonClick(button)
        }
    }
    
}

// MARK: - LifeCircle Function
extension TemplateAverageWidthTitleView {
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
extension TemplateAverageWidthTitleView {
    
    /// 界面布局
    fileprivate func initialUI() -> Void {
        self.addSubview(self.mainView)
        self.initialMainView(self.mainView)
//        self.mainView.snp.makeConstraints { (make) in
//            make.edges.equalToSuperview()
//        }
    }
    fileprivate func initialMainView(_ mainView: UIView) -> Void {
        // buttons
        let btnMaxW: CGFloat = kScreenWidth / CGFloat(self.titles.count)
        for (index, title) in self.titles.enumerated() {
            let button: UIButton = UIButton.init(type: .custom)
            mainView.addSubview(button)
            button.set(title: title, titleColor: UIColor.white, for: .normal)
            button.set(title: title, titleColor: UIColor.green, for: .selected)
            button.set(font: UIFont.init(name: "PingFangSC-Medium", size: 16))
            button.tag = self.titleBtnTagBase + index
            button.addTarget(self, action: #selector(buttonClick(_:)), for: .touchUpInside)
            button.contentEdgeInsets = UIEdgeInsets.init(top: 0, left: 20, bottom: 0, right: 20)
//            button.snp.makeConstraints { (make) in
//                make.top.bottom.equalToSuperview()
//                make.centerX.equalTo(btnMaxW * (CGFloat(index) + 0.5))
//            }
        }
        self.squareBtn = (mainView.viewWithTag(self.titleBtnTagBase + 0) as! UIButton)
        self.recommendBtn = (mainView.viewWithTag(self.titleBtnTagBase + 1) as! UIButton)
        self.followBtn = (mainView.viewWithTag(self.titleBtnTagBase + 2) as! UIButton)
        // slider
        mainView.addSubview(self.sliderView)
        self.sliderView.backgroundColor = UIColor.green
        self.sliderView.set(cornerRadius: self.sliderViewH * 0.5)
//        self.sliderView.snp.makeConstraints { (make) in
//            make.width.equalTo(self.sliderViewW)
//            make.height.equalTo(self.sliderViewH)
//            make.bottom.equalToSuperview()
//            make.centerX.equalTo(self.squareBtn)
//        }
        // 默认选中
        if let selectedBtn = mainView.viewWithTag(self.titleBtnTagBase + self.selectedIndex) as? UIButton {
            selectedBtn.isSelected = true
            self.currentSelectedBtn = selectedBtn
//            self.sliderView.snp.remakeConstraints { (make) in
//                make.width.equalTo(self.sliderViewW)
//                make.height.equalTo(self.sliderViewH)
//                make.bottom.equalToSuperview()
//                make.centerX.equalTo(self.squareBtn)
//            }
        }
    }
    
}
// MARK: - Private UI Xib加载后处理
extension TemplateAverageWidthTitleView {
    /// awakeNib时的处理
    fileprivate func initialInAwakeNib() -> Void {
        
    }
}

// MARK: - Data Function
extension TemplateAverageWidthTitleView {

}

// MARK: - Event Function
extension TemplateAverageWidthTitleView {
    /// 按钮点击
    @objc fileprivate func buttonClick(_ button: UIButton) -> Void {
        if button.isSelected {
            return
        }
        let index: Int = button.tag - self.titleBtnTagBase
        self.currentSelectedBtn?.isSelected = false
        button.isSelected = true
        self.currentSelectedBtn = button
        self.selectedIndex = index
//        self.sliderView.snp.remakeConstraints { (make) in
//            make.width.equalTo(self.sliderViewW)
//            make.height.equalTo(self.sliderViewH)
//            make.bottom.equalToSuperview()
//            make.centerX.equalTo(button)
//        }
        UIView.animate(withDuration: 0.25) {
            self.mainView.layoutIfNeeded()
        }
        self.delegate?.titleView(self, didClicked: self.titles[index], at: index)
        self.titleClickAction?(self, self.titles[index], index)
    }
    
}

// MARK: - Extension Function
extension TemplateAverageWidthTitleView {
    
}

// MARK: - Delegate Function

// MARK: - <XXXDelegate>
extension TemplateAverageWidthTitleView {
    
}


