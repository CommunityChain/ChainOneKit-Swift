//
//  TemplateUICollectionViewController.swift
//  ChainOneKit
//
//  Created by 小唐 on 2019/3/5.
//  Copyright © 2019 ChainOne. All rights reserved.
//
//  UICollectionView的模板

import UIKit

class TemplateUICollectionViewController: UIViewController {

    // MARK: - Internal Property
    
    
    // MARK: - Private Property
    
    weak var collectionView: UICollectionView!
    
    fileprivate var sourceList: [String] = []
    // 上拉加载更多
    fileprivate let limit: Int = 20
    fileprivate var offset: Int = 0
    
    fileprivate let lrMargin: CGFloat = 15
    fileprivate let itemHorMargin: CGFloat = 10
    
    // forSupplementaryViewOfKind
    fileprivate let headerKind: String = UICollectionView.elementKindSectionHeader
    fileprivate let footerKind: String = UICollectionView.elementKindSectionFooter
    
    /// 返回顶部按钮
    fileprivate let backTopBtn: UIButton = UIButton.init(type: .custom)
    
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

// MARK: - LifeCircle Function
extension TemplateUICollectionViewController {

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
extension TemplateUICollectionViewController {

    /// 页面布局
    @objc func initialUI() -> Void {
        self.view.backgroundColor = UIColor.white
        // 1. navBar
        self.navigationItem.title = "Template"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: self, action: #selector(navBarLeftItemClick))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "明细", style: .plain, target: self, action: #selector(navBarLeftItemClick))
        // collectionView
        let layout = UICollectionViewFlowLayout.init()
        //layout.sectionInset = UIEdgeInsets.zero
        //layout.headerReferenceSize = CGSize(width: kScreenWidth, height: 50)
        let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        self.view.addSubview(collectionView)
        collectionView.backgroundColor = UIColor.white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(TemplateUICollectionViewCell.self, forCellWithReuseIdentifier: TemplateUICollectionViewCell.identifier)
        //collectionView.register(TemplateSectionHeader.self, forSupplementaryViewOfKind: self.headerKind, withReuseIdentifier: TemplateSectionHeader.identifier)
        //collectionView.mj_header = XDRefreshHeader(refreshingTarget: self, refreshingAction: #selector(headerRefresh))
        //collectionView.mj_footer = XDRefreshFooter(refreshingTarget: self, refreshingAction: #selector(footerLoadMore))
        //collectionView.mj_header.isHidden = false
        //collectionView.mj_footer.isHidden = true
        //collectionView.snp.makeConstraints { (make) in
        //    make.edges.equalToSuperview()
        //}
        self.collectionView = collectionView
    }

}

// MARK: - Data(数据处理与加载)
extension TemplateUICollectionViewController {

    // MARK: - Private  数据处理与加载
    @objc func initialDataSource() -> Void {
        //self.collectionView.mj_header.beginRefreshing()
        self.setupAsDemo()
    }
    ///
    fileprivate func setupAsDemo() -> Void {
        for i in 0...35 {
            self.sourceList.append("\(i)")
        }
        self.collectionView.reloadData()
    }
    
}

// MARK: - Event(事件响应)
extension TemplateUICollectionViewController {

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

// MARK: - Request(网络请求)
extension TemplateUICollectionViewController {

    /// 下拉刷新请求
    @objc fileprivate func refreshRequest() -> Void {
//        MallHomeNetworkManager.refreshHomeData(for: self.currency, limit: self.limit) { [weak self](status, msg, model) in
//            guard let `self` = self else {
//                return
//            }
//            self.collectionView.mj_header.endRefreshing()
//            self.collectionView.mj_footer.state = .idle
//            guard status, let model = model else {
//                Toast.showToast(title: msg)
//                return
//            }
//            self.dataModel = model
//            self.offset = 0
//            if let lastSpecial = model.specialList.last, lastSpecial.type == .custom {
//                self.offset = lastSpecial.productList.count
//            }
//            self.collectionView.mj_footer.isHidden = self.offset < self.limit
//            self.collectionView.reloadData()
//        }
    }
    
    /// 上拉加载更多请求
    @objc fileprivate func loadMoreRequest() -> Void {
//        MallHomeNetworkManager.loadMoreHomeData(for: self.currency, offset: self.offset, limit: self.limit) { [weak self](status, msg, models) in
//            guard let `self` = self else {
//                return
//            }
//            self.collectionView.mj_footer.endRefreshing()
//            guard status, let models = models else {
//                return
//            }
//            if let lastSpecial = self.dataModel.specialList.last, lastSpecial.type == .custom {
//                lastSpecial.productList.append(contentsOf: models)
//                self.offset = lastSpecial.productList.count
//                if models.count < self.limit {
//                    self.collectionView.mj_footer.endRefreshingWithNoMoreData()
//                }
//            }
//            self.collectionView.reloadData()
//        }
    }

}

// MARK: - Notification
extension TemplateUICollectionViewController {
    
}

// MARK: - Extension Function
extension TemplateUICollectionViewController {
}

// MARK: - Delegate Function

// MARK: - <UICollectionViewDataSource>
extension TemplateUICollectionViewController: UICollectionViewDataSource {

    ///
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        let count = 1
        return count
    }

    ///
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count: Int = 25
        return count
    }

    ///
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = TemplateUICollectionViewCell.cellInCollectionView(collectionView, at: indexPath)
        cell.model = "Just Test"
        return cell
    }
    
//    /// 附加视图(section的header与footer)
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        let header = TemplateSectionHeader.headerInCollectionView(collectionView, at: indexPath, of: self.headerKind)
//        return header
//    }
    
//func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool
//func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath)
//func indexTitles(for collectionView: UICollectionView) -> [String]?
//func collectionView(_ collectionView: UICollectionView, indexPathForIndexTitle title: String, at index: Int) -> IndexPath
    
}

// MARK: - <UICollectionViewDelegate>
extension TemplateUICollectionViewController: UICollectionViewDelegate {

    ///
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }

    ///
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didSelectItemAt \(indexPath)")
    }
    
}

extension TemplateUICollectionViewController: UICollectionViewDelegateFlowLayout {

    /// 定义每个UICollectionViewCell 的大小
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let lrMargin: CGFloat = 10
        let itemHorMargin: CGFloat = 5
        let itemW: CGFloat = (kScreenWidth - lrMargin * 2.0 - itemHorMargin) * 0.5
        let size: CGSize = CGSize.init(width: itemW, height: itemW)
        return size
    }
    
    /// 定义每个UICollectionViewCell 的 margin
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let insets: UIEdgeInsets = UIEdgeInsets.zero
        return insets
    }
    
//    /// section头视图大小
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        // 第一个section不需要头视图
//        let headerSize = CGSize(width: kScreenWidth, height: 80)
//        let size: CGSize = (0 == section) ? CGSize.zero : headerSize
//        return size
//    }
    
}


