//
//  ViewController.swift
//  WebviewApp
//
//  Created by 조재흥 on 19. 4. 9..
//  Copyright © 2019 hngfu. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    var wkWebView: WKWebView?
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        wkWebView = WKWebView(frame: .zero, configuration: webConfiguration)
        view = wkWebView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let stringURL = "https://m.shopping.naver.com"
        guard let url = URL(string: stringURL) else { return }
        let urlRequest = URLRequest(url: url)
        wkWebView?.load(urlRequest)
    }


}

extension ViewController: WKUIDelegate {
    
}
