//
//  ViewController.swift
//  WebViewApp
//
//  Created by YOUTH2 on 2018. 6. 19..
//  Copyright © 2018년 JINiOS. All rights reserved.
//

import UIKit
import WebKit
import SafariServices

class ViewController: UIViewController, WKUIDelegate, WKNavigationDelegate, SFSafariViewControllerDelegate, WKScriptMessageHandler {

    let configuration = WKWebViewConfiguration()
    let userContentController = WKUserContentController()
    let storeURL = URL(string: ProgramDescription.storeURL.value)
    var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white

        configuration.userContentController = self.userContentController
        userContentController.add(self, name: ProgramDescription.slideMenu.value)
        makePopUpUnable()

        webView = WKWebView(frame: self.view.bounds, configuration: self.configuration)
        webView.uiDelegate = self
        webView.navigationDelegate = self

        view.addSubview(webView)
        setConstraint()

        let myRequest = URLRequest(url: storeURL!)
        self.webView.load(myRequest)
    }


    private func makePopUpUnable() {
        let scriptURL = Bundle.main.path(forResource: ProgramDescription.injectionSource.value, ofType: ProgramDescription.js.value)
        var scriptContent = ""
        do {
            scriptContent = try String(contentsOfFile: scriptURL ?? "", encoding: String.Encoding.utf8)
            let userScript = WKUserScript(source: scriptContent, injectionTime: .atDocumentEnd, forMainFrameOnly: false)

            userContentController.addUserScript(userScript)
        } catch let error {
            print("Cannot Load File\nError log:\(error)")
            return
        }
    }

    private func setConstraint() {
        let safeArea = view.safeAreaLayoutGuide

        webView.translatesAutoresizingMaskIntoConstraints = false
        self.webView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        self.webView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        self.webView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        self.webView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
    }

    // Search.php
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let pageDescription = navigationAction.request.description

        if pageDescription.contains(ProgramDescription.searchPHP.value) {
            let safariViewController = SFSafariViewController(url: navigationAction.request.url!)
            safariViewController.delegate = self
            self.present(safariViewController, animated: true, completion: nil)
            decisionHandler(.cancel)
        } else {
            decisionHandler(.allow)
        }
    }

    // .slide-navi
        public func userContentController(_ userContentController: WKUserContentController,
                                          didReceive message: WKScriptMessage) {
            guard message.name == ProgramDescription.slideMenu.value else { return }
            print(message.body)
        }

}

