//
//  ViewController.swift
//  WebviewApp
//
//  Created by oingbong on 03/12/2018.
//  Copyright © 2018 oingbong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var webview: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webview.delegate = self
        guard let url = URL(string: "https://m.baeminchan.com") else { return }
        let request = URLRequest(url: url)
        webview.loadRequest(request)
        self.view.addSubview(webview)
    }
}

extension ViewController: UIWebViewDelegate {
    func webViewDidStartLoad(_ webView: UIWebView) {
        print(#function)
        print("webView : \(webView)")
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print(#function)
        print("webView : \(webView)")
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        print(#function)
        print("webView : \(webView)")
        print("error : \(error)")
    }
}
