//
//  TemplateControllerMultiTitle.swift
//  SwiftKit-XiaoDe
//
//  Created by 小唐 on 2018/10/20.
//  Copyright © 2018 ChainOne. All rights reserved.
//
//  多标题界面

import UIKit

class TemplateMultiTitleController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}



//enum TBRecommendUserType: String {
//    /// 热门
//    case hot
//    /// 人气
//    case popularity
//    /// 活跃
//    case active
//}
//
//class TBRecommendUserHomeVC: TSViewController
//{
//    // MARK: - Internal Property
//
//    var selectdType: TBRecommendUserType = .hot {
//        didSet {
//            switch selectdType {
//            case .hot:
//                self.selectedIndex = 0
//            case .popularity:
//                self.selectedIndex = 1
//            case .active:
//                self.selectedIndex = 2
//            }
//        }
//    }
//
//    // MARK: - Private Property
//
//    fileprivate let scrollView: UIScrollView = UIScrollView()
//    fileprivate let titleView: UIView = UIView()
//
//    fileprivate let titleViewH: CGFloat = 60
//    fileprivate let items: [(type: TBRecommendUserType, title: String)] = [(type: TBRecommendUserType.hot, title:"热门"), (type: TBRecommendUserType.active, title: "活跃"), (type: TBRecommendUserType.popularity, title: "人气")]
//
//    fileprivate let hotListVC: TBRecommendUserListVC = TBRecommendUserListVC()
//    fileprivate let titleBtnTagBase: Int = 250
//
//    fileprivate var selectedTitleBtn: UIButton?
//    fileprivate var selectedIndex: Int = 0 {
//        didSet {
//            if oldValue == selectedIndex {
//                return
//            }
//            self.selectedTitleIndex(selectedIndex)
//            self.scrollView.setContentOffset(CGPoint(x: CGFloat(selectedIndex) * kScreenWidth, y: 0), animated: false)
//        }
//    }
//
//
//    // MARK: - Initialize Function
//
//    init() {
//        super.init(nibName: nil, bundle: nil)
//    }
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        //fatalError("init(coder:) has not been implemented")
//    }
//
//}
//
//// MARK: - Internal Function
//
//// MARK: - LifeCircle Function
//extension TBRecommendUserHomeVC {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.initialUI()
//        self.initialDataSource()
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//    }
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//    }
//}
//
//// MARK: - UI
//extension TBRecommendUserHomeVC {
//    /// 页面布局
//    fileprivate func initialUI() -> Void {
//        self.view.backgroundColor = UIColor.white
//        // navigationbar
//        self.navigationItem.title = "用户推荐"
//        // titleView
//        self.view.addSubview(self.titleView)
//        self.initialTitleView(self.titleView)
//        self.titleView.snp.makeConstraints { (make) in
//            make.leading.trailing.top.equalToSuperview()
//            make.height.equalTo(self.titleViewH)
//        }
//        // scrollView
//        self.view.addSubview(self.scrollView)
//        self.initialScrollView(self.scrollView)
//        self.scrollView.snp.makeConstraints { (make) in
//            make.leading.trailing.bottom.equalToSuperview()
//            make.top.equalTo(self.titleView.snp.bottom)
//        }
//    }
//    fileprivate func initialTitleView(_ titleView: UIView) -> Void {
//        var leftView: UIView = titleView
//        for (index, item) in self.items.enumerated() {
//            let button: UIButton = UIButton(type: .custom)
//            titleView.addSubview(button)
//            button.tag = self.titleBtnTagBase + index
//            button.set(title: item.title, titleColor: UIColor(hex: 0x333333), for: .normal)
//            button.set(title: item.title, titleColor: TSColor.main.theme, for: .selected)
//            button.set(font: UIFont(name: "PingFangSC-Medium", size: 16))
//            button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
//            button.addTarget(self, action: #selector(titleBtnClick(_:)), for: .touchUpInside)
//            button.snp.makeConstraints { (make) in
//                make.top.bottom.equalToSuperview()
//                if 0 == index {
//                    make.leading.equalTo(leftView)
//                } else {
//                    make.leading.equalTo(leftView.snp.trailing)
//                }
//            }
//            leftView = button
//        }
//        if let button = self.titleView.viewWithTag(self.titleBtnTagBase + self.selectedIndex) as? UIButton {
//            button.isSelected = true
//            self.selectedTitleBtn = button
//        }
//    }
//    fileprivate func initialScrollView(_ scrollView: UIScrollView) -> Void {
//        scrollView.delegate = self
//        scrollView.showsHorizontalScrollIndicator = false
//        // child
//        let scrollChildH: CGFloat = kScreenHeight - self.titleViewH - kNavigationStatusBarHeight
//        for (index, item) in self.items.enumerated() {
//            let childView: UIView = UIView()
//            scrollView.addSubview(childView)
//            childView.snp.makeConstraints { (make) in
//                make.top.bottom.equalToSuperview()
//                make.height.equalTo(scrollChildH)
//                make.leading.equalToSuperview().offset(kScreenWidth * CGFloat(index))
//                if self.titles.count - 1 == index {
//                    make.trailing.equalToSuperview()
//                }
//            }
//            // childVC
//            let childVC: TBRecommendUserListVC = TBRecommendUserListVC(type: item.type)
//            self.addChildViewController(childVC)
//            childView.addSubview(childVC.view)
//            childVC.view.snp.makeConstraints { (make) in
//                make.edges.equalToSuperview()
//            }
//        }
//    }
//
//}
//
//// MARK: - Data(数据处理与加载)
//extension TBRecommendUserHomeVC {
//    /// 默认数据加载
//    fileprivate func initialDataSource() -> Void {
//
//    }
//
//    /// titleView的选中处理
//    fileprivate func selectedTitleIndex(_ index: Int) -> Void {
//        self.selectedTitleBtn?.isSelected = false
//        if let button = self.titleView.viewWithTag(self.titleBtnTagBase + index) as? UIButton {
//            button.isSelected = true
//            self.selectedTitleBtn = button
//        }
//    }
//}
//
//// MARK: - Event(事件响应)
//extension TBRecommendUserHomeVC {
//    @objc fileprivate func titleBtnClick(_ button: UIButton) -> Void {
//        let index = button.tag - self.titleBtnTagBase
//        self.selectedIndex = index
//    }
//}
//
//// MARK: - Notification
//extension TBRecommendUserHomeVC {
//
//}
//
//// MARK: - Extension Function
//extension TBRecommendUserHomeVC {
//
//}
//
//// MARK: - Delegate Function
//
//// MARK: - <UIScrollViewDelegate>
//extension TBRecommendUserHomeVC: UIScrollViewDelegate {
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        let scrollIndex: Int = Int(scrollView.contentOffset.x / kScreenWidth)
//        self.selectedIndex = scrollIndex
//    }
//}
//
