//
//  ViewController.swift
//  WebviewApp
//
//  Created by joon-ho kil on 8/27/19.
//  Copyright © 2019 길준호. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {
    @IBOutlet weak var webView: UIWebView!
    let url = URL(string: "https://m.shopping.naver.com")
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        webView.delegate = self
        
        if let url = url{
            webView.loadRequest(URLRequest(url: url))
        }
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebView.NavigationType) -> Bool {
        print(#function)
        dump(request)
        dump(navigationType)
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
        dump(error)
    }
}

