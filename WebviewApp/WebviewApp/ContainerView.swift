//
//  ContainerView.swift
//  WebviewApp
//
//  Created by joon-ho kil on 8/28/19.
//  Copyright © 2019 길준호. All rights reserved.
//

import UIKit
import WebKit
import SafariServices

class ContainerView: UIView, WKNavigationDelegate, WKScriptMessageHandler {
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
        guard let scriptPath = Bundle.main.path(forResource: "querySelect", ofType: "js"),
            var scriptSource = try? String(contentsOfFile: scriptPath) else { return }
        scriptSource.removeLast()
        webView.evaluateJavaScript(scriptSource, completionHandler: nil)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        guard navigationAction.navigationType == .linkActivated else {
            decisionHandler(.allow)
            return
        }
        
        if let url = navigationAction.request.url, url.path.hasSuffix("menu.nhn") {
            safariWebViewPresent(url: url)
            decisionHandler(.cancel)
            return
        }
        
        decisionHandler(.allow)
    }
    
    private func makeWebViewConfig(javaScriptSource: String) -> WKWebViewConfiguration {
        let contentController = WKUserContentController()
        let script = WKUserScript(source: javaScriptSource, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        contentController.addUserScript(script)
        contentController.add(self, name: "jsHandler")
        
        let config = WKWebViewConfiguration()
        config.userContentController = contentController
        
        return config
    }
    
    func safariWebViewPresent(url: URL) {
        let vc = SFSafariViewController(url: url)
        
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            
            topController.present(vc, animated: true, completion: nil)
        }
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        let menus = Menus(body: message.body)
        dump(menus)
    }
}
