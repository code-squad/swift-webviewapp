//
//  ViewController.swift
//  WebviewApp
//
//  Created by oingbong on 03/12/2018.
//  Copyright © 2018 oingbong. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    var webview: WKWebView!
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        let source = """
        var popup = document.querySelector('.app-download-popup');
        if (popup != null) {
            popup.style.display = 'none';
        }
        """
        let userScript = WKUserScript(source: source, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        let contentController = WKUserContentController()
        contentController.addUserScript(userScript)
        webConfiguration.userContentController = contentController
        webview = WKWebView(frame: .zero, configuration: webConfiguration)
        view = webview
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = URL(string: "https://m.baeminchan.com") else { return }
        let request = URLRequest(url: url)
        webview.load(request)
    }
}
