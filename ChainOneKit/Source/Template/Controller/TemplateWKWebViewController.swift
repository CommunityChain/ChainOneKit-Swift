//
//  TemplateWKWebViewController.swift
//  ChainOneKit
//
//  Created by 小唐 on 2019/1/11.
//  Copyright © 2019 ChainOne. All rights reserved.
//
//  使用WKWebView的控制器模板

import UIKit
import WebKit

class TemplateWKWebViewController: UIViewController
{

    // MARK: - Internal Property
    let source: XDWebViewSource
    
    // MARK: - Private Property
    fileprivate weak var webView: WKWebView!
    
    // MARK: - Initialize Function
    
    init(source: XDWebViewSource) {
        self.source = source
        super.init(nibName: nil, bundle: nil)
    }
    init(url: URL) {
        self.source = XDWebViewSource.url(url: url)
        super.init(nibName: nil, bundle: nil)
    }
    init(strUrl: String) {
        self.source = XDWebViewSource.strUrl(strUrl: strUrl)
        super.init(nibName: nil, bundle: nil)
    }
    init(html: String, baseURL: URL? = Bundle.main.bundleURL) {
        self.source = XDWebViewSource.html(html: html, baseURL: baseURL)
        super.init(nibName: nil, bundle: nil)
    }
    /// 1. 该构造方法需要进一步进行测试
    init(data: Data, mimeType: String = "text/html", encodingName: String = "utf-8", baseURL: URL = Bundle.main.bundleURL) {
        self.source = XDWebViewSource.data(data: data, mimeType: mimeType, encodingName: encodingName, baseURL: baseURL)
        super.init(nibName: nil, bundle: nil)
    }
    /// 文件加载
    init(htmlFile: String) {
        guard let htmlPath = Bundle.main.path(forAuxiliaryExecutable: htmlFile), let htmlData: Data = try? Data(contentsOf: URL(fileURLWithPath: htmlPath)), let htmlString = String(data: htmlData, encoding: String.Encoding.utf8) else {
            fatalError("htmlFile \(htmlFile) 加载异常")
            //return
        }
        //self.source = XDWebViewSource.data(data: htmlData, mimeType: "text/html", encodingName: "utf-8", baseURL: Bundle.main.bundleURL)
        self.source = XDWebViewSource.html(html: htmlString, baseURL: Bundle.main.bundleURL)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        //super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Internal Function
extension TemplateWKWebViewController {
    
}

// MARK: - LifeCircle/Override Function
extension TemplateWKWebViewController {

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
extension TemplateWKWebViewController {

    /// 页面布局
    fileprivate func initialUI() -> Void {
        self.view.backgroundColor = UIColor.white
        // webview
        let config: WKWebViewConfiguration = WKWebViewConfiguration()
        let webView: WKWebView = WKWebView(frame: CGRect.zero, configuration: config)
        self.view.addSubview(webView)
        webView.scrollView.bounces = false
        //webView.uiDelegate = self
        //webView.navigationDelegate = self
        webView.frame = self.view.bounds
//        webView.snp.makeConstraints { (make) in
//            make.edges.equalToSuperview()
//        }
        self.webView = webView
        // 注册js(使用WKScriptMessageHandler)
        
    }

}

// MARK: - Data Function
extension TemplateWKWebViewController {

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
            self.webView.load(request)
        case .strUrl(let strUrl):
            if let url = URL(string: strUrl) {
                let request = URLRequest(url: url)
                self.webView.load(request)
            }
        case .html(let html, let baseURL):
            self.webView.loadHTMLString(html, baseURL: baseURL)
        case .data(let data, let mimeType, let encodingName, let baseURL):
            self.webView.load(data, mimeType: mimeType, characterEncodingName: encodingName, baseURL: baseURL)
        }
    }

}

// MARK: - Event Function
extension TemplateWKWebViewController {
    
}

// MARK: - Request Function
extension TemplateWKWebViewController {
    
}

// MARK: - Enter Page
extension TemplateWKWebViewController {
    
}

// MARK: - Notification Function
extension TemplateWKWebViewController {
    
}

// MARK: - Extension Function
extension TemplateWKWebViewController {

    /// 执行js
    fileprivate func executeJS(_ js: String, complete: ((Any?, Error?) -> Void)? = nil ) -> Void {
        self.webView.evaluateJavaScript(js) { (result, error) in
            complete?(result, error)
        }
    }

}

// MARK: - Delegate Function

// MARK: - <WKNavigationDelegate>
extension TemplateWKWebViewController: WKNavigationDelegate {
    
    /// 加载完成
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // print(webView.configuration.userContentController)
    }
    
    /// 加载错误
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        
    }
    
    /// 在提交的主帧中发生错误时调用
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        
    }
    
}

// MARK: - <WKUIDelegate>
extension TemplateWKWebViewController: WKUIDelegate {
    
}
