//
//  TemplateViewController.swift
//  SwiftKit-XiaoDe
//
//  Created by 小唐 on 13/02/2018.
//  Copyright © 2018 ChainOne. All rights reserved.
//
//  UIViewController 的使用模板

import UIKit

/// UIViewController 的使用模板
class TemplateViewController: UIViewController
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
    
    //    /// injection回调
    //    @objc func injected() -> Void {
    //        self.viewDidLoad()
    //    }
}

// MARK: - Internal Function

// MARK: - LifeCircle & Override Function
extension TemplateViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialUI()
        self.initialDataSource()
    }
    
    /// 控制器的view将要显示
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    /// 控制器的view将要布局子控件
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    /// 控制器的view布局子控件完成
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    /// 控制器的view完全显示
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    /// 控制器的view即将消失
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    /// 控制器的view完全消失
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    // MARK: - 状态栏显示隐藏
    
    // 隐藏状态栏
    override var prefersStatusBarHidden: Bool {
        return true
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
extension TemplateViewController {
    /// 页面布局
    fileprivate func initialUI() -> Void {
        self.view.backgroundColor = UIColor.white
    }
}

// MARK: - Data(数据处理与加载)
extension TemplateViewController {
    /// 默认数据加载
    fileprivate func initialDataSource() -> Void {
        
    }
}

// MARK: - Event(事件响应)
extension TemplateViewController {
    
}

// MARK: - Enter Page
extension TemplateViewController {
    
}

// MARK: - Notification
extension TemplateViewController {
    
}

// MARK: - Extension Function
extension TemplateViewController {
    
}

// MARK: - Delegate Function

// MARK: - <>
extension TemplateViewController {
    
}

