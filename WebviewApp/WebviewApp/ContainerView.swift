//
//  ContainerView.swift
//  WebviewApp
//
//  Created by joon-ho kil on 8/28/19.
//  Copyright © 2019 길준호. All rights reserved.
//

import UIKit
import WebKit

class ContainerView: UIView {
    private var webView: WKWebView?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        let javaScriptSource = "var popup = document.querySelector(`.part_banner`); if (popup != null) { popup.style.display = `none`; }"
        let config = makeWebViewConfig(javaScriptSource: javaScriptSource)
        webView = WKWebView(frame: self.bounds, configuration: config)
        if let webView = webView {
            addSubview(webView)
        }
    }
    
    func webViewLoad(url input: String){
        guard let url = URL(string: input) else {
            return
        }
        let request = URLRequest(url: url)
        webView?.load(request)
    }
    
    private func makeWebViewConfig(javaScriptSource: String) -> WKWebViewConfiguration {
        let contentController = WKUserContentController()
        let script = WKUserScript(source: javaScriptSource, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        contentController.addUserScript(script)
        
        let config = WKWebViewConfiguration()
        config.userContentController = contentController
        
        return config
    }
    
    func setWebViewNavigationDelegate(viewController: ViewController) {
        webView?.navigationDelegate = viewController
    }
    
    func addScriptMessageHandler(viewController: ViewController) {
        webView?.configuration.userContentController.add(viewController, name: "jsHandler")
    }
}
