//
//  ViewController.swift
//  WebviewApp
//
//  Created by 조재흥 on 19. 4. 9..
//  Copyright © 2019 hngfu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var uiWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let stringURL = "https://m.shopping.naver.com"
        guard let url = URL(string: stringURL) else { return }
        let urlRequest = URLRequest(url: url)
        uiWebView.loadRequest(urlRequest)
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UIWebViewDelegate {
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        print(#function)
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print(#function)
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        print(#function)
        print("error", error.localizedDescription)
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebView.NavigationType) -> Bool {
        print(#function)
        print("request", request)
        print("navigationType", navigationType)
        return false
    }
}
