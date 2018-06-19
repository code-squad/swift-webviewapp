//
//  ViewController.swift
//  WebViewApp
//
//  Created by YOUTH2 on 2018. 6. 19..
//  Copyright © 2018년 JINiOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    let storeURL = URL(string: "https://m.baeminchan.com")

    override func viewDidLoad() {
        super.viewDidLoad()
        webView.delegate = self
        webView.loadRequest(URLRequest(url: storeURL!))
        print(#function)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    deinit {
        webView.delegate = nil
    }

}

extension ViewController: UIWebViewDelegate {

    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        print(#function)
        return true
    }

    func webViewDidStartLoad(_ webView: UIWebView) {
        print(#function)
    }

    func webViewDidFinishLoad(_ webView: UIWebView) {
        print(#function)
    }
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        print(#function)
    }
}
