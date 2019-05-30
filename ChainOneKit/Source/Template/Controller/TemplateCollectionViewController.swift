//
//  TemplateCollectionViewController.swift
//  ChainOneKit
//
//  Created by 小唐 on 2019/3/5.
//  Copyright © 2019 ChainOne. All rights reserved.
//
//  UICollectionView的模板

import UIKit

class TemplateCollectionViewController: UIViewController {
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
extension TemplateCollectionViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialUI()
        self.initialDataSource()
    }
}

// MARK: - UI
extension TemplateCollectionViewController {
    /// 页面布局
    @objc func initialUI() -> Void {
        self.view.backgroundColor = UIColor.white
        // nav
        self.navigationItem.title = "TemplateCollection"
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
        collectionView.register(TemplateCollectionViewCell.self, forCellWithReuseIdentifier: TemplateCollectionViewCell.identifier)
        //collectionView.register(TemplateSectionHeader.self, forSupplementaryViewOfKind: self.headerKind, withReuseIdentifier: TemplateSectionHeader.identifier)
        //collectionView.mj_header = XDRefreshHeader(refreshingTarget: self, refreshingAction: #selector(refreshRequest))
        //collectionView.mj_footer = XDRefreshFooter(refreshingTarget: self, refreshingAction: #selector(loadmoreRequest))
        //collectionView.mj_footer.isHidden = true
        //collectionView.snp.makeConstraints { (make) in
        //    make.edges.equalToSuperview()
        //}
        self.collectionView = collectionView
    }
}

// MARK: - Data(数据处理与加载)
extension TemplateCollectionViewController {
    // MARK: - Private  数据处理与加载
    @objc func initialDataSource() -> Void {
        //self.collectionView.mj_header.beginRefreshing()
    }
    
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
    @objc fileprivate func loadmoreRequest() -> Void {
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

// MARK: - Event(事件响应)
extension TemplateCollectionViewController {
    @objc fileprivate func leftBarItemClick() -> Void {
        
    }
    @objc fileprivate func rightBarItemClick() -> Void {
        
    }
}

// MARK: - Notification
extension TemplateCollectionViewController {
    
}

// MARK: - Extension Function
extension TemplateCollectionViewController {
}

// MARK: - Delegate Function

// MARK: - <UICollectionViewDataSource>
extension TemplateCollectionViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        let count = 1
        return count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count: Int = 25
        return count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = TemplateCollectionViewCell.cellInCollectionView(collectionView, at: indexPath)
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
extension TemplateCollectionViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didSelectItemAt \(indexPath)")
    }
    
}

extension TemplateCollectionViewController: UICollectionViewDelegateFlowLayout {
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


