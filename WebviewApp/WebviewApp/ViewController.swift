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
        let querySelector = "#list_area1"
        let displayNoneScript = WKUserScript(source: JavaScriptSource.displayNone(of: querySelector),
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
        let querySelector = ".g_lnb_menu"
        webView.evaluateJavaScript(JavaScriptSource.menuList(of: querySelector,
                                                             handlerName: handlerName),
                                   completionHandler: nil)
    }
}

extension ViewController: WKScriptMessageHandler {
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == handlerName {
            guard let jsonData = try? JSONSerialization.data(withJSONObject: message.body,
                                                       options: []),
                let menuInfoArray = try? JSONDecoder().decode([MenuInfo].self, from: jsonData) else { return }
            print("Message from JS: (")
            for menuInfo in menuInfoArray {
                print("     {")
                print("     title = \"", menuInfo.title, "\";", separator: "")
                print("     urlString = \"", menuInfo.urlString, "\";", separator: "")
                print("  },")
            }
            print(")")
        }
    }
}

struct MenuInfo: Decodable {
    let title: String
    let urlString: String
}
