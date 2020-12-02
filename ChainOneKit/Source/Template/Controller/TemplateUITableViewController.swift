//
//  TemplateUITableViewController.swift
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

class TemplateUITableViewController: UIViewController
{
    
    // MARK: - Internal Property

    // MARK: - Private Property
    fileprivate let tableView: UITableView = UITableView(frame: CGRect.zero, style: .plain)
    
    fileprivate var sourceList: [String] = []
    fileprivate var offset: Int = 0
    fileprivate let limit: Int = 20
    
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

// MARK: - LifeCircle/Override Function
extension TemplateUITableViewController {

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

// MARK: - UI Function
extension TemplateUITableViewController {
    /// 界面布局
    fileprivate func initialUI() -> Void {
        self.view.backgroundColor = UIColor.white
        // 1. navBar
        self.navigationItem.title = "Template"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: self, action: #selector(navBarLeftItemClick))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "明细", style: .plain, target: self, action: #selector(navBarLeftItemClick))
        // 2. tableView
        self.view.addSubview(self.tableView)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.separatorStyle = .none
        self.tableView.separatorInset = UIEdgeInsets.zero
        self.tableView.tableFooterView = UIView()
        self.tableView.estimatedRowHeight = 250
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.backgroundColor = UIColor.white
        self.tableView.keyboardDismissMode = UIScrollView.KeyboardDismissMode.onDrag
        //self.tableView.mj_header = XDRefreshHeader(refreshingTarget: self, refreshingAction: #selector(headerRefresh))
        //self.tableView.mj_footer = XDRefreshFooter(refreshingTarget: self, refreshingAction: #selector(footerLoadMore))
        //self.tableView.mj_header.isHidden = false
        //self.tableView.mj_footer.isHidden = true
        self.tableView.frame = self.view.bounds
//        self.tableView.snp.makeConstraints { (make) in
//            make.edges.equalToSuperview()
//        }
        // 顶部位置 的版本适配
        if #available(iOS 11.0, *) {
            self.tableView.contentInsetAdjustmentBehavior = .never
        } else if #available(iOS 9.0, *) {
            self.automaticallyAdjustsScrollViewInsets = false
        }
    }

}

// MARK: - Data Function
extension TemplateUITableViewController {

    // MARK: - Private  数据处理与加载
    fileprivate func initialDataSource() -> Void {
        //self.tableView.mj_header.beginRefreshing()
        self.setupAsDemo()
    }
    ///
    fileprivate func setupAsDemo() -> Void {
        for i in 0...25 {
            self.sourceList.append("\(i)")
        }
        self.tableView.reloadData()
    }

}

// MARK: - Event Function
extension TemplateUITableViewController {

    /// 导航栏 左侧按钮点击响应
    @objc fileprivate func navBarLeftItemClick() -> Void {
        print("TemplateUIViewController navBarLeftItemClick")
        self.navigationController?.popViewController(animated: true)
    }
    /// 导航栏 右侧侧按钮点击响应
    @objc fileprivate func navBarRightItemClick() -> Void {
        print("TemplateUIViewController navBarRightItemClick")
    }

    /// 顶部刷新
    @objc fileprivate func headerRefresh() -> Void {
        self.refreshRequest()
    }
    /// 底部记载更多
    @objc fileprivate func footerLoadMore() -> Void {
        self.loadMoreRequest()
    }
    
}

// MARK: - Request Function
extension TemplateUITableViewController {

    /// 下拉刷新请求
    fileprivate func refreshRequest() -> Void {
//        MessageNetworkManager.getMessageList(offset: 0, limit: self.limit) { [weak self](status, msg, models) in
//            guard let `self` = self else {
//                return
//            }
//            self.tableView.mj_header.endRefreshing()
//            self.tableView.mj_footer.state = .idle
//            guard status, let models = models else {
//                ToastUtil.showToast(title: msg)
//                self.tableView.showDefaultEmpty = self.sourceList.isEmpty
//                return
//            }
//            self.sourceList = models
//            self.offset = self.sourceList.count
//            self.tableView.mj_footer.isHidden = models.count < self.limit
//            self.tableView.showDefaultEmpty = self.sourceList.isEmpty
//            self.tableView.reloadData()
//        }
    }
    
    /// 上拉加载更多请求
    fileprivate func loadMoreRequest() -> Void {
//        MessageNetworkManager.getMessageList(offset: self.offset, limit: self.limit) { [weak self](status, msg, models) in
//            guard let `self` = self else {
//                return
//            }
//            self.tableView.mj_footer.endRefreshing()
//            guard status, let models = models else {
//                self.tableView.mj_footer.endRefreshingWithWeakNetwork()
//                return
//            }
//            if models.count < self.limit {
//                self.tableView.mj_footer.endRefreshingWithNoMoreData()
//            }
//            self.sourceList += models
//            self.offset = self.sourceList.count
//            self.tableView.reloadData()
//        }
    }

}

// MARK: - Enter Page
extension TemplateUITableViewController {
    
}

// MARK: - Notification Function
extension TemplateUITableViewController {
    
}

// MARK: - Extension Function
extension TemplateUITableViewController {
    
}

// MARK: - Delegate Function

// MARK: - <UITableViewDataSource>
extension TemplateUITableViewController: UITableViewDataSource {

    ///
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    ///
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sourceList.count
    }

    ///
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "CellIdentifier"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if nil == cell {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: identifier)
        }
        
        //cell?.preservesSuperviewLayoutMargins = false
        //cell?.layoutMargins = UIEdgeInsets.zero
        //cell?.selectionStyle = .none
        cell?.textLabel?.text = self.sourceList[indexPath.row]
        
        return cell!
    }
    
}

// MARK: - <UITableViewDelegate>
extension TemplateUITableViewController: UITableViewDelegate {

    ///
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //return UITableView.automaticDimension
        return 44
    }

    ///
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRowAt\(indexPath.row)")
    }
    
}

