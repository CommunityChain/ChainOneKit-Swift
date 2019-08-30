//
//  TemplateControllerPresented.swift
//  ChainOneKit
//
//  Created by 小唐 on 2019/1/21.
//  Copyright © 2019 ChainOne. All rights reserved.
//
//  被present出来的作为半透明弹窗的模板

import UIKit

class TemplateControllerPresented: UIViewController
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
    
//    /// injection回调
//    @objc func injected() -> Void {
//        self.viewDidLoad()
//    }
}

// MARK: - Internal Function

// MARK: - LifeCircle Function
extension TemplateControllerPresented {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialUI()
        self.initialDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
}

// MARK: - UI
extension TemplateControllerPresented {
    /// 页面布局
    fileprivate func initialUI() -> Void {
        self.view.backgroundColor = UIColor.white
        
    }
}

// MARK: - Data(数据处理与加载)
extension TemplateControllerPresented {
    /// 默认数据加载
    fileprivate func initialDataSource() -> Void {
        
    }
}

// MARK: - Event(事件响应)
extension TemplateControllerPresented {
    
}

// MARK: - Notification
extension TemplateControllerPresented {
    
}

// MARK: - Extension Function
extension TemplateControllerPresented {
    
}

// MARK: - Delegate Function

// MARK: - <>
extension TemplateControllerPresented {
    
}

