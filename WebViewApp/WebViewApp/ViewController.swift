//
//  ViewController.swift
//  WebViewApp
//
//  Created by YOUTH2 on 2018. 6. 19..
//  Copyright © 2018년 JINiOS. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate {

    let configuration = WKWebViewConfiguration()
    let userContentController = WKUserContentController()
    let storeURL = URL(string: "https://m.baeminchan.com")
    var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white

        webView = WKWebView()
        webView.uiDelegate = self
        configuration.userContentController = self.userContentController

        webView = WKWebView(frame: self.view.bounds, configuration: self.configuration)
        view.addSubview(webView)
        setConstraint()

        makePopUpUnable()
        let myRequest = URLRequest(url: storeURL!)
        self.webView.load(myRequest)
    }

    private func makePopUpUnable() {
        let scriptURL = Bundle.main.path(forResource: "injectionsource", ofType: "js")
        var scriptContent = ""
        do {
            scriptContent = try String(contentsOfFile: scriptURL ?? "", encoding: String.Encoding.utf8)
        } catch let error {
            print("Cannot Load File\nError log:\(error)")
        }
        let userScript = WKUserScript(source: scriptContent, injectionTime: .atDocumentEnd, forMainFrameOnly: false)

        userContentController.addUserScript(userScript)
    }

    private func setConstraint() {
        let safeArea = view.safeAreaLayoutGuide

        webView.translatesAutoresizingMaskIntoConstraints = false
        self.webView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        self.webView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        self.webView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        self.webView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
    }


}
