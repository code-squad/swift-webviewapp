//
//  containerView.swift
//  WebviewApp
//
//  Created by joon-ho kil on 8/28/19.
//  Copyright © 2019 길준호. All rights reserved.
//

import UIKit
import WebKit

class containerView: UIView, WKNavigationDelegate {
    override func draw(_ rect: CGRect) {
        let contentController = WKUserContentController()
        let scriptSource = "var popup = document.querySelector(`.part_banner`); if (popup != null) { popup.style.display = `none`; }"
        let script = WKUserScript(source: scriptSource, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        contentController.addUserScript(script)
        
        let config = WKWebViewConfiguration()
        config.userContentController = contentController
        
        let webView = WKWebView(frame: self.bounds, configuration: config)
        
        let url = URL(string: "https://m.shopping.naver.com")
        let request = URLRequest(url: url!)
        webView.load(request)
        addSubview(webView)
        webView.navigationDelegate = self
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        let scriptSource = "var popup = document.querySelector(`.part_banner`); if (popup != null) { popup.style.display = `none`; }"
        
        webView.evaluateJavaScript(scriptSource, completionHandler: { (object, error) in
            
        })
    }
}


