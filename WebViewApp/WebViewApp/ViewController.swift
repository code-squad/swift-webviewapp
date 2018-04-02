//
//  ViewController.swift
//  WebViewApp
//
//  Created by TaeHyeonLee on 2018. 3. 30..
//  Copyright © 2018년 ChocOZerO. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    private weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setWebView()
        guard let url = URL(string: "https://m.baeminchan.com") else { return }
        let urlRequest = URLRequest(url: url)
        self.webView.load(urlRequest)
    }

    private func setWebView() {
        let webConfiguration = WKWebViewConfiguration()
        let contentController = WKUserContentController()
        let source = """
            var popup = document.querySelector('.app-download-popup');
            if (popup != null) {
                popup.style.display = 'none';
            }
            console.log("ttttt")
        """
        let userScript = WKUserScript(source: source, injectionTime: .atDocumentEnd, forMainFrameOnly: false)
        contentController.addUserScript(userScript)
        webConfiguration.userContentController = contentController
        webView = WKWebView(frame: view.frame, configuration: webConfiguration)
        view.addSubview(webView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

