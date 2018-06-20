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

    var webView: WKWebView!
    let storeURL = URL(string: "https://m.baeminchan.com")

    override func loadView() {
        webView = WKWebView()
        webView.uiDelegate = self
        view = UIView()
        view.backgroundColor = UIColor.white
        view.addSubview(webView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        webView.translatesAutoresizingMaskIntoConstraints = false
        let myRequest = URLRequest(url: storeURL!)
        self.webView.load(myRequest)

        let safeArea = view.safeAreaLayoutGuide

        self.webView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        self.webView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        self.webView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        self.webView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
    }

}
