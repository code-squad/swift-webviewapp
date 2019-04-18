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
    private let handlerName = "callbackHandler"
    
    override func loadView() {
        
        let displayNoneSource = """
        var popup = document.querySelector('#list_area1');
        if (popup != null) {
            popup.style.display = 'none';
        }
        """
        
        let displayNoneScript = WKUserScript(source: displayNoneSource,
                                  injectionTime: .atDocumentEnd,
                                  forMainFrameOnly: true)
        
        let contentController = WKUserContentController()
        contentController.addUserScript(displayNoneScript)
        contentController.add(self, name: handlerName)
        
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
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
        let menuListSource = """
        function menuList() {
        const menu = document.querySelector('.g_lnb_menu');
        const menuLists = Array.from(menu.children);
        let jsonArray = [];
        for (const menuList of menuLists) {
        let jsonInfo = {};
        jsonInfo['title'] = menuList.innerText;
        jsonInfo['urlString'] = menuList.firstElementChild.href;
        jsonArray.push(jsonInfo);
        }
        return jsonArray;
        }
        webkit.messageHandlers.\(handlerName).postMessage(menuList());
        """
        
        webView.evaluateJavaScript(menuListSource,
                                   completionHandler: nil)
    }
}

extension ViewController: WKScriptMessageHandler {
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == handlerName {
            print("Message from JS: ", message.body)
        }
    }
}
