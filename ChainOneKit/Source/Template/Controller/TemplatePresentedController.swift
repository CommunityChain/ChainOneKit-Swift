//
//  TemplatePresentedController.swift
//  ChainOneKit
//
//  Created by 小唐 on 2019/1/21.
//  Copyright © 2019 ChainOne. All rights reserved.
//
//  被present出来的作为半透明弹窗的模板

import UIKit

class TemplatePresentedController: UIViewController
{

    // MARK: - Internal Property
    
    // MARK: - Private Property
    
    // MARK: - Initialize Function
    
    init() {
        super.init(nibName: nil, bundle: nil)
        // present后的透明展示
        self.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
    }
    required init?(coder aDecoder: NSCoder) {
        //super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Internal Function

// MARK: - LifeCircle Function
extension TemplatePresentedController {

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

}

// MARK: - UI
extension TemplatePresentedController {

    /// 页面布局
    fileprivate func initialUI() -> Void {
        self.view.backgroundColor = UIColor.white
        
    }

}

// MARK: - Data(数据处理与加载)
extension TemplatePresentedController {

    /// 默认数据加载
    fileprivate func initialDataSource() -> Void {
        
    }

}

// MARK: - Event(事件响应)
extension TemplatePresentedController {
    
}

// MARK: - Notification
extension TemplatePresentedController {
    
}

// MARK: - Extension Function
extension TemplatePresentedController {
    
}

// MARK: - Delegate Function

// MARK: - <>
extension TemplatePresentedController {
    
}

