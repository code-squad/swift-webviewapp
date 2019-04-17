//
//  ViewController.swift
//  WebviewApp
//
//  Created by 조재흥 on 19. 4. 9..
//  Copyright © 2019 hngfu. All rights reserved.
//

import UIKit
import WebKit
import SafariServices

class ViewController: UIViewController {

    var wkWebView: WKWebView?
    
    override func loadView() {
        
        let source = """
        var popup = document.querySelector('#list_area1');
        if (popup != null) {
            popup.style.display = 'none';
        }
        """

        let script = WKUserScript(source: source,
                                  injectionTime: .atDocumentEnd,
                                  forMainFrameOnly: true)
        
        let contentController = WKUserContentController()
        contentController.addUserScript(script)
        
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.userContentController = contentController
        
        wkWebView = WKWebView(frame: .zero, configuration: webConfiguration)
        view = wkWebView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.wkWebView?.navigationDelegate = self
        let stringURL = "https://m.shopping.naver.com"
        guard let url = URL(string: stringURL) else { return }
        let urlRequest = URLRequest(url: url)
        wkWebView?.load(urlRequest)
    }
}

extension ViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        let path = "/menu.nhn"
        if let url = webView.url,
            url.absoluteString.hasSuffix(path) {
            let safariViewController = SFSafariViewController(url: url)
            present(safariViewController,
                    animated: true,
                    completion: nil)
        }
    }
}
