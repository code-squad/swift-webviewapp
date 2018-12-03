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
    @IBOutlet weak var webview: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = URL(string: "https://m.baeminchan.com") else { return }
        let request = URLRequest(url: url)
        webview.load(request)
    }
}
