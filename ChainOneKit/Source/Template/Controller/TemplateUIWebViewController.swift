//
//  TemplateUIWebViewController.swift
//  ProjectTemplate-Swift
//
//  Created by 小唐 on 2019/1/11.
//  Copyright © 2019 TangXiaoDe. All rights reserved.
//
//  使用UIWebView的控制器模板

import UIKit
import JavaScriptCore

class TemplateUIWebViewController: UIViewController
{
    // MARK: - Internal Property
    let source: WebViewSource
    
    // MARK: - Private Property
    fileprivate let webView: UIWebView = UIWebView.init(frame: CGRect.zero)
    
    // MARK: - Initialize Function
    
    init(source: WebViewSource) {
        self.source = source
        super.init(nibName: nil, bundle: nil)
    }
    init(url: URL) {
        self.source = WebViewSource.url(url: url)
        super.init(nibName: nil, bundle: nil)
    }
    init(strUrl: String) {
        self.source = WebViewSource.strUrl(strUrl: strUrl)
        super.init(nibName: nil, bundle: nil)
    }
    init(html: String, baseURL: URL? = Bundle.main.bundleURL) {
        self.source = WebViewSource.html(html: html, baseURL: baseURL)
        super.init(nibName: nil, bundle: nil)
    }
    /// 1. 该构造方法需要进一步进行测试
    init(data: Data, mimeType: String = "text/html", encodingName: String = "utf-8", baseURL: URL = Bundle.main.bundleURL) {
        self.source = WebViewSource.data(data: data, mimeType: mimeType, encodingName: encodingName, baseURL: baseURL)
        super.init(nibName: nil, bundle: nil)
    }
    /// 文件加载
    init(htmlFile: String) {
        guard let htmlPath = Bundle.main.path(forAuxiliaryExecutable: htmlFile), let htmlData: Data = try? Data(contentsOf: URL(fileURLWithPath: htmlPath)), let htmlString = String(data: htmlData, encoding: String.Encoding.utf8) else {
            fatalError("htmlFile \(htmlFile) 加载异常")
            //return
        }
        //self.source = WebViewSource.data(data: htmlData, mimeType: "text/html", encodingName: "utf-8", baseURL: Bundle.main.bundleURL)
        self.source = WebViewSource.html(html: htmlString, baseURL: Bundle.main.bundleURL)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        //super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    /// injection回调
    @objc func injected() -> Void {
        self.viewDidLoad()
    }
}

// MARK: - Internal Function

// MARK: - LifeCircle Function
extension TemplateUIWebViewController {
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
extension TemplateUIWebViewController {
    /// 页面布局
    fileprivate func initialUI() -> Void {
        self.view.backgroundColor = UIColor.white
        // navigationbar
        
        // webview
        self.view.addSubview(self.webView)
        self.webView.scrollView.bounces = false
        self.webView.delegate = self
        self.webView.scrollView.showsVerticalScrollIndicator = false
        self.webView.frame = self.view.bounds
//        self.webView.snp.makeConstraints { (make) in
//            make.edges.equalToSuperview()
//        }
    }
}

// MARK: - Data(数据处理与加载)
extension TemplateUIWebViewController {
    /// 默认数据加载
    fileprivate func initialDataSource() -> Void {
        // open func loadRequest(_ request: URLRequest)
        // open func loadHTMLString(_ string: String, baseURL: URL?)
        // open func load(_ data: Data, mimeType MIMEType: String, textEncodingName: String, baseURL: URL)
        // 注意加载本地数据时的baseURL Bundle.main.bundleURL
        
        // 注：通过url方式加载的可配置request
        switch self.source {
        case .url(let url):
            //let request = URLRequest(url: url)
            let request = URLRequest(url: url, cachePolicy: URLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 60.0)
            self.webView.loadRequest(request)
        case .strUrl(let strUrl):
            if let url = URL(string: strUrl) {
                let request = URLRequest(url: url)
                self.webView.loadRequest(request)
            }
        case .html(let html, let baseURL):
            self.webView.loadHTMLString(html, baseURL: baseURL)
        case .data(let data, let mimeType, let encodingName, let baseURL):
            self.webView.load(data, mimeType: mimeType, textEncodingName: encodingName, baseURL: baseURL)
        }
    }
}

// MARK: - Event(事件响应)
extension TemplateUIWebViewController {
    
}

// MARK: - Notification
extension TemplateUIWebViewController {
    
}

// MARK: - Extension Function
extension TemplateUIWebViewController {
    /// 执行js - 子类继承，需要放开权限
    func executeJS(_ js: String) -> String? {
        return self.webView.stringByEvaluatingJavaScript(from: js)
        // 获取网页标题的js: "document.title"
        
    }
    
    /// 注入js
    fileprivate func initialJSContent(with webview: UIWebView) -> Void {
        guard let context = webView.value(forKeyPath: "documentView.webView.mainFrame.javaScriptContext") as? JSContext else {
            return
        }
        // 打印异常,由于JS的异常信息是不会在OC中被直接打印的,所以我们在这里添加打印异常信息,
        context.exceptionHandler = { (context: JSContext?, exception: JSValue?) -> Void in
            print(exception.debugDescription)
        }
        
        // js注入
    }
}
extension TemplateUIWebViewController {
    
    /// 刷新网页
    func reloadData() {
        self.webView.reload()
    }
}

// MARK: - Delegate Function

// MARK: - <UIWebViewDelegate>
extension TemplateUIWebViewController: UIWebViewDelegate {
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebView.NavigationType) -> Bool {
        return true
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        // 1. 获取网页title
        let title = self.executeJS("document.title")
        self.navigationItem.title = title
        // 2. js注入
        self.initialJSContent(with: webView)
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        
    }
    
}

