//
//  ViewController.swift
//  WebViewApp
//
//  Created by TaeHyeonLee on 2018. 3. 30..
//  Copyright © 2018년 ChocOZerO. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = URL(string: "https://m.baeminchan.com") else { return }
        webView.loadRequest(URLRequest(url: url))
        webView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        print(#function)
        print(webView, request, navigationType)
        guard request.url != nil else { return false }
        return true
    }

    func webViewDidStartLoad(_ webView: UIWebView) {
        print(#function)
        print(webView)
    }

    func webViewDidFinishLoad(_ webView: UIWebView) {
        print(#function)
        print(webView)
    }

    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        print(#function)
        print(webView, error)
    }

}

