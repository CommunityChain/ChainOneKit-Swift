//
//  TemplateWebViewSource.swift
//  SwiftTemplate
//
//  Created by 小唐 on 2019/5/20.
//  Copyright © 2019 ChainOne. All rights reserved.
//
//  WebView加载源

import Foundation

typealias WebViewSource = TemplateWebViewSource
enum TemplateWebViewSource {
    // open func loadRequest(_ request: URLRequest)
    // open func loadHTMLString(_ string: String, baseURL: URL?)
    // open func load(_ data: Data, mimeType MIMEType: String, textEncodingName: String, baseURL: URL)
    // 注意加载本地数据时的baseURL Bundle.main.bundleURL
    
    case url(url: URL)
    case strUrl(strUrl: String)
    case html(html: String, baseURL: URL?)
    case data(data: Data, mimeType: String, encodingName: String, baseURL: URL)
}
