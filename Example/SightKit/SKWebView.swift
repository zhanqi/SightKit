//
//  SKWebView.swift
//  SightKit_Example
//
//  Created by mac on 27/10/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class SKWebView: UIView ,WKNavigationDelegate,WKUIDelegate,WKScriptMessageHandler{
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        buildViews()
    }
    var webView:WKWebView!
    var progressView:UIProgressView!
    var extraWebView:WKWebView? //新开的窗口
    func buildViews() {
        //Mark:- HTML5调用Native部分
        let scriptHandle = WKUserContentController()    //新建一个处理类
        scriptHandle.add(self, name: "logout")
        let config = WKWebViewConfiguration()   //新建一个WKWebView的配置
        config.userContentController = scriptHandle
        
        webView = WKWebView(frame: .zero, configuration: config)
        webView.allowsBackForwardNavigationGestures = true//允许侧滑
        webView.uiDelegate = self
        webView.navigationDelegate = self
        self.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.csLeft().csRight().csSafeAreaTop().csSafeAreaBottom()
        
        progressView = UIProgressView()
        self.addSubview(progressView)
        progressView.progressTintColor = .red
        progressView.csFullfillHorizontal().csTop().csHeight(1)
        
        webView.addObserver(self, forKeyPath: "estimatedProgress", options: NSKeyValueObservingOptions.new, context: nil)
        webView.addObserver(self, forKeyPath: "title", options: NSKeyValueObservingOptions.new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            self.progressView.progress = Float(webView.estimatedProgress)
            self.progressView.isHidden = self.progressView.progress >= 1.0
        }
        if keyPath == "title" {
            self.viewController?.navigationItem.title = self.webView.title
        }
    }
    deinit {
        self.webView.removeObserver(self, forKeyPath: "estimatedProgress")
        self.webView.removeObserver(self, forKeyPath: "title")
    }
    // MARK: - WKNavigationDelegate
    
    // 在发送请求之前，决定是否跳转
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        print(#function,#line,navigationAction.request.url?.absoluteString)
        decisionHandler(WKNavigationActionPolicy.allow)
    }
    
    // 在收到响应后，决定是否跳转
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        decisionHandler(WKNavigationResponsePolicy.allow)
        return
        
        guard let response = navigationResponse.response as? HTTPURLResponse,
            let url = navigationResponse.response.url else {
                decisionHandler(.cancel)
                return
        }
        
        if let headerFields = response.allHeaderFields as? [String: String] {
            let cookies = HTTPCookie.cookies(withResponseHeaderFields: headerFields, for: url)
            cookies.forEach { cookie in
                if #available(iOS 11.0, *) {
                    webView.configuration.websiteDataStore.httpCookieStore.setCookie(cookie)
                } else {
                    // Fallback on earlier versions
                }
            }
        }
        
        decisionHandler(WKNavigationResponsePolicy.allow)
    }
    
    // 页面开始加载时调用
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print(#function,#line)
        
    }
    // 接收到服务器跳转请求之后调用
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        print(#function,#line,webView.url?.absoluteString)
        
    }
    
    // 页面加载失败时调用
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print(#function,#line,error.localizedDescription)
        
    }
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print(#function,#line)
        
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print(#function,#line)
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print(#function,#line,error.localizedDescription)
        
    }
    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        print(#function,#line)
        completionHandler(.performDefaultHandling, nil);
    }
    func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        print(#function,#line)
    }
    
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        let alert = UIAlertController(title: "标题", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "确定", style: .default, handler: { (_) -> Void in
            // We must call back js
            completionHandler()
        }))
        
        self.viewController?.present(alert, animated: true, completion: nil)
    }
    //** 确认框 **
    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        let alert = UIAlertController(title: "标题", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "确定", style: .default, handler: { (_) -> Void in
            // 点击完成后，可以做相应处理，最后再回调js端
            completionHandler(true)
        }))
        alert.addAction(UIAlertAction(title: "取消", style: .cancel, handler: { (_) -> Void in
            // 点击取消后，可以做相应处理，最后再回调js端
            completionHandler(false)
        }))
        self.viewController?.present(alert, animated: true, completion: nil)
    }
    //** 输入框 **
    func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
        let alert = UIAlertController(title: prompt, message: defaultText, preferredStyle: .alert)
        alert.addTextField { (textField: UITextField) -> Void in
            textField.textColor = UIColor.red
        }
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (_) -> Void in
            // 处理好之前，将值传到js端
            completionHandler(alert.textFields![0].text!)
        }))
        self.viewController?.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - WKUIDelegate
    // 创建一个新的WebView
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        print(#function,#line)
        if extraWebView != nil {
            extraWebView?.removeFromSuperview()
            extraWebView = nil
        }
        extraWebView = WKWebView(frame: .zero, configuration: configuration)
        self.addSubview(extraWebView!)
        extraWebView?.csFullfill()
        return extraWebView
    }
    func webViewDidClose(_ webView: WKWebView) {
        print(#function,#line)
        
    }
//    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
//        print(#function,#line)
//
//    }
//    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
//        print(#function,#line)
//
//    }
//    func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
//        print(#function,#line)
//
//    }

    func webView(_ webView: WKWebView, commitPreviewingViewController previewingViewController: UIViewController) {
        print(#function,#line)
        
    }
    
    //=====================================
    //Mark:- WKScriptMessageHandler代理方法
    //=====================================
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        let fun = message.name
        switch fun {
        case "logout":           //退出
            self.logoutAct()
        default:
            print("no such case!")
        }
    }
    func logoutAct() -> Void {
    }
}

