//
//  ViewController.swift
//  WebviewApp
//
//  Created by joon-ho kil on 8/27/19.
//  Copyright © 2019 길준호. All rights reserved.
//

import UIKit
import WebKit
import SafariServices

class ViewController: UIViewController, WKNavigationDelegate, WKScriptMessageHandler {
    @IBOutlet weak var containerView: ContainerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        containerView.AddScriptMessageHandler(viewController: self)
        containerView.setWebViewNavigationDelegate(viewController: self)
        containerView.webViewLoad(url: "https://m.shopping.naver.com")
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

