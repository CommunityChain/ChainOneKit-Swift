//
//  TemplateHorScrollPageController.swift
//  ChainOneKit
//
//  Created by 小唐 on 2019/1/18.
//  Copyright © 2019 ChainOne. All rights reserved.
//
//  水平的ScroollPage界面模板

import UIKit

class TemplateHorScrollPageController: UIViewController
{
    // MARK: - Internal Property
    
    // MARK: - Private Property
    fileprivate let scrollView: UIScrollView = UIScrollView()
    fileprivate let followListVC = TemplateTableViewController()
    fileprivate let recommentListVC = TemplateViewController()
    fileprivate let aroundListVC = TemplateTableViewController()
    
    fileprivate let titles: [String] = ["关注", "推荐", "附近"]
    fileprivate let titleSegment: UISegmentedControl = UISegmentedControl(items: ["关注", "推荐", "附近"])

    fileprivate let topTitleViewH: CGFloat = 45
    
    fileprivate var selectedIndex: Int = 0 {
        didSet {
            if oldValue == selectedIndex {
                return
            }
            self.titleSegment.selectedSegmentIndex = selectedIndex
            self.scrollView.setContentOffset(CGPoint(x: CGFloat(selectedIndex) * kScreenWidth, y: 0), animated: false)
        }
    }
    
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
extension TemplateHorScrollPageController {
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
extension TemplateHorScrollPageController {
    /// 页面布局
    fileprivate func initialUI() -> Void {
        self.view.backgroundColor = UIColor.white
        // navigationBar
        self.titleSegment.bounds = CGRect.init(x: 0, y: 0, width: 150, height: 25)
        self.titleSegment.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], for: .normal)
        self.titleSegment.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], for: .selected)
        self.titleSegment.tintColor = UIColor.blue
        self.titleSegment.addTarget(self, action: #selector(segmentClick(_:)), for: .valueChanged)
        
        self.navigationItem.titleView = self.titleSegment
        // scrollView
        self.view.addSubview(self.scrollView)
        self.initialScrollView(self.scrollView)
        self.scrollView.frame = self.view.bounds
//        self.scrollView.snp.makeConstraints { (make) in
//            make.edges.equalToSuperview()
//        }
    }
    /// scrollView 布局
    fileprivate func initialScrollView(_ scrollView: UIScrollView) -> Void {
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
        let scrollViewH: CGFloat = kScreenHeight - kTabBarHeight - kNavigationStatusBarHeight
        let childVCList: [UIViewController] = [self.followListVC, self.recommentListVC, self.aroundListVC]
        for (index, childVC) in childVCList.enumerated() {
            self.addChild(childVC)
            scrollView.addSubview(childVC.view)
            childVC.view.frame = CGRect.init(x: CGFloat(index) * kScreenWidth, y: 0, width: kScreenWidth, height: scrollViewH)
//            childVC.view.snp.makeConstraints { (make) in
//                make.top.bottom.equalToSuperview()
//                make.width.equalTo(kScreenWidth)
//                make.height.equalTo(scrollViewH)
//                make.leading.equalToSuperview().offset(CGFloat(index) * kScreenWidth)
//                if index == childVCList.count - 1 {
//                    make.trailing.equalToSuperview()
//                }
//            }
        }
        scrollView.contentSize = CGSize.init(width: kScreenWidth * CGFloat(childVCList.count), height: scrollViewH)
    }
    
}

// MARK: - Data(数据处理与加载)
extension TemplateHorScrollPageController {
    /// 默认数据加载
    fileprivate func initialDataSource() -> Void {
        // 默认选择
        self.titleSegment.selectedSegmentIndex = 0
        self.selectedIndex = 0
    }
}

// MARK: - Event(事件响应)
extension TemplateHorScrollPageController {
    
    /// segment点击响应
    @objc fileprivate func segmentClick(_ segment: UISegmentedControl) -> Void {
        let index = segment.selectedSegmentIndex
        self.selectedIndex = index
    }
}

// MARK: - Notification
extension TemplateHorScrollPageController {
    
}

// MARK: - Extension Function
extension TemplateHorScrollPageController {
    
}

// MARK: - Delegate Function

// MARK: - <UIScrollViewDelegate>
extension TemplateHorScrollPageController: UIScrollViewDelegate {
    /// 滑动结束 回调
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let scrollIndex: Int = Int(scrollView.contentOffset.x / kScreenWidth)
        self.selectedIndex = scrollIndex
    }
}

