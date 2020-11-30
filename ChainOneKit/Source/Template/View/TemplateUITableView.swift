//
//  TemplateUITableView.swift
//  SwiftKit-XiaoDe
//
//  Created by 小唐 on 29/05/2018.
//  Copyright © 2018 ChainOne. All rights reserved.
//
//  TemplateTableView

import UIKit

typealias TemplateListView = TemplateUITableView
class TemplateUITableView: UIView {
    
    // MARK: - Internal Property

    // MARK: - Private Property
    
    fileprivate let tableView: UITableView = UITableView(frame: CGRect.zero, style: .plain)

    fileprivate var sourceList: [String] = []
    fileprivate var offset: Int = 0
    fileprivate let limit: Int = 20
    
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
        self.initialUI()
        //fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCircle Function
    
    
}

// MARK: - Internal Function

// MARK: - Private  UI
extension TemplateUITableView {
    
    // 界面布局
    fileprivate func initialUI() -> Void {
        self.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        //tableView.separatorStyle = .none
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 250
        tableView.frame = self.bounds
    }
    
}

// MARK: - Data Function

// MARK: - Event Function

// MARK: - Extension Function

// MARK: - Delegate Function

// MARK: - <UITableViewDataSource>
extension TemplateUITableView: UITableViewDataSource {

    ///
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    ///
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
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
        cell?.textLabel?.text = "Just Test"
        
        return cell!
    }
    
}

// MARK: - <UITableViewDelegate>
extension TemplateUITableView: UITableViewDelegate {

    ///
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //return UITableViewAutomaticDimension
        return 44
    }

    ///
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRowAt\(indexPath.row)")
    }
    
}



