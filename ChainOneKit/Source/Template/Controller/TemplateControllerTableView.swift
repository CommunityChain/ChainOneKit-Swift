//
//  TemplateControllerTableView.swift
//  SwiftKit-XiaoDe
//
//  Created by 小唐 on 13/02/2018.
//  Copyright © 2018 ChainOne. All rights reserved.
//
//  UIViewController含有UITableView时的使用模板

/**
 简单的 复杂的
 **/

import UIKit

class TemplateControllerTableView: UIViewController
{
    
    // MARK: - Internal Property
    // MARK: - Private Property
    fileprivate let tableView: UITableView = UITableView(frame: CGRect.zero, style: .plain)
    
    fileprivate var sourceList: [String] = []
    
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

// MARK: - LifeCircle Function
extension TemplateControllerTableView {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialUI()
        self.initialDataSource()
    }
}

// MARK: - UI
extension TemplateControllerTableView {
    fileprivate func initialUI() -> Void {
        self.view.backgroundColor = UIColor.white
        // 1. navigationbar
        // 2. tableView
        self.view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 250
        tableView.showsVerticalScrollIndicator = false
        //tableView.mj_header =
        //tableView.mj_footer =
        //tableView.mj_footer.isHidden = true
        tableView.frame = self.view.bounds
//        tableView.snp.makeConstraints { (make) in
//            make.edges.equalToSuperview()
//        }
    }
}

// MARK: - Data(数据处理与加载)
extension TemplateControllerTableView {
    // MARK: - Private  数据处理与加载
    fileprivate func initialDataSource() -> Void {
        
    }
}

// MARK: - Event(事件响应)
extension TemplateControllerTableView {
    
}

// MARK; - Request(网络请求)
extension TemplateControllerTableView {
    
}

// MARK: - Enter Page
extension TemplateControllerTableView {
    
}

// MARK: - Notification
extension TemplateControllerTableView {
    
}

// MARK: - Extension
extension TemplateControllerTableView {
    
}

// MARK: - Delegate Function

// MARK: - <UITableViewDataSource>
extension TemplateControllerTableView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "CellIdentifier"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if nil == cell {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: identifier)
        }
        
        //cell?.preservesSuperviewLayoutMargins = false
        //cell?.layoutMargins = UIEdgeInsets.zero
        //cell?.selectionStyle = .none
        cell?.textLabel?.text = "Just Test"
        
        return cell!
    }
    
    
}

// MARK: - <UITableViewDelegate>
extension TemplateControllerTableView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //return UITableView.automaticDimension
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRowAt\(indexPath.row)")
    }
    
}

