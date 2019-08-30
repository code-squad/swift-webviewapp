//
//  ContainerView.swift
//  WebviewApp
//
//  Created by joon-ho kil on 8/28/19.
//  Copyright © 2019 길준호. All rights reserved.
//

import UIKit
import WebKit

class ContainerView: UIView, WKNavigationDelegate {
    private var webView: WKWebView?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        let javaScriptSource = "var popup = document.querySelector(`.part_banner`); if (popup != null) { popup.style.display = `none`; }"
        let config = makeWebViewConfig(javaScriptSource: javaScriptSource)
        webView = WKWebView(frame: self.bounds, configuration: config)
        if let webView = webView {
            addSubview(webView)
            webView.navigationDelegate = self
        }
    }
    
    func webViewLoad(url input: String){
        guard let url = URL(string: input) else {
            return
        }
        let request = URLRequest(url: url)
        webView!.load(request)
    }
    
    internal func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        let scriptSource = "var popup = document.querySelector(`.part_banner`); if (popup != null) { popup.style.display = `none`; }"
        
        webView.evaluateJavaScript(scriptSource, completionHandler: { (object, error) in
            
        })
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if navigationAction.navigationType == .linkActivated  {
            if let url = navigationAction.request.url, url.path.hasSuffix("menu.nhn") {
                
                print("menu 페이지가 뜰 때!")
                decisionHandler(.cancel)
                
            } else {
                print("Open it locally")
                decisionHandler(.allow)
            }
        } else {
            print("not a user click")
            decisionHandler(.allow)
        }
    }
    
    private func makeWebViewConfig(javaScriptSource: String) -> WKWebViewConfiguration {
        let contentController = WKUserContentController()
        let script = WKUserScript(source: javaScriptSource, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        contentController.addUserScript(script)
        
        let config = WKWebViewConfiguration()
        config.userContentController = contentController
        
        return config
    }
}


