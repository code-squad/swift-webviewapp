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
    
        let contentController = WKUserContentController()
        let scriptSource = "var popup = document.querySelector(`.part_banner`); if (popup != null) { popup.style.display = `none`; }"
        let script = WKUserScript(source: scriptSource, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        contentController.addUserScript(script)
        
        let config = WKWebViewConfiguration()
        config.userContentController = contentController
        
        webView = WKWebView(frame: self.bounds, configuration: config)
        if let webView = webView {
            addSubview(webView)
            webView.navigationDelegate = self
        }
    }
    
    func webViewLoadLink(url: URL){
        let request = URLRequest(url: url)
        webView!.load(request)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        let scriptSource = "var popup = document.querySelector(`.part_banner`); if (popup != null) { popup.style.display = `none`; }"
        
        webView.evaluateJavaScript(scriptSource, completionHandler: { (object, error) in
            
        })
    }
}


