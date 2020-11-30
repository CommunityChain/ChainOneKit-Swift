//
//  TemplateUIViewController.swift
//  SwiftKit-XiaoDe
//
//  Created by 小唐 on 13/02/2018.
//  Copyright © 2018 ChainOne. All rights reserved.
//
//  UIViewController 的使用模板

import UIKit

/// UIViewController 的使用模板
class TemplateUIViewController: UIViewController
{

    // MARK: - Internal Property
    
    // MARK: - Private Property
    
    // MARK: - Initialize Function
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Internal Function

// MARK: - LifeCircle & Override Function
extension TemplateUIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialUI()
        self.initialDataSource()
    }
    
    /// 控制器的view将要显示
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    /// 控制器的view即将消失
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    /// 控制器的view完全显示
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    /// 控制器的view完全消失
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    /// 控制器的view将要布局子控件
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    /// 控制器的view布局子控件完成
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    // MARK: - 状态栏
    
    // 状态栏 显示隐藏
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // 状态栏颜色
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    // MARK: - 横竖屏切换
    
    // 支持旋转
    override var shouldAutorotate: Bool {
        return true
    }
    // 支持的方向
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscapeLeft // 仅横屏
    }
    /// present时一开始的方向 很重要
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return UIInterfaceOrientation.landscapeLeft
    }
    
}

// MARK: - UI
extension TemplateUIViewController {

    /// 页面布局
    fileprivate func initialUI() -> Void {
        self.view.backgroundColor = UIColor.white
        // navBar
        self.navigationItem.title = "Template"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: self, action: #selector(navBarLeftItemClick))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "明细", style: .plain, target: self, action: #selector(navBarLeftItemClick))
        //
    }

}

// MARK: - Data(数据处理与加载)
extension TemplateUIViewController {

    /// 默认数据加载
    fileprivate func initialDataSource() -> Void {
        self.setupAsDemo()
    }
    ///
    fileprivate func setupAsDemo() -> Void {
        
    }

}

// MARK: - Event(事件响应)
extension TemplateUIViewController {

    /// 导航栏 左侧按钮点击响应
    @objc fileprivate func navBarLeftItemClick() -> Void {
        print("TemplateUIViewController navBarLeftItemClick")
        self.navigationController?.popViewController(animated: true)
    }
    /// 导航栏 右侧侧按钮点击响应
    @objc fileprivate func navBarRightItemClick() -> Void {
        print("TemplateUIViewController navBarRightItemClick")
    }

}

// MARK: - Enter Page
extension TemplateUIViewController {
    
}

// MARK: - Notification
extension TemplateUIViewController {
    
}

// MARK: - Extension Function
extension TemplateUIViewController {
    
}

// MARK: - Delegate Function

// MARK: - <>
extension TemplateUIViewController {
    
}

