//
//  ViewController.swift
//  WebViewApp
//
//  Created by TaeHyeonLee on 2018. 3. 30..
//  Copyright © 2018년 ChocOZerO. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = URL(string: "https://m.baeminchan.com") else { return }
        webView.load(URLRequest(url: url))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

