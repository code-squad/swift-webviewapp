//
//  ViewController.swift
//  WebviewApp
//
//  Created by joon-ho kil on 8/27/19.
//  Copyright © 2019 길준호. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var containerView: ContainerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        containerView.webViewLoad(url: "https://m.shopping.naver.com")
    }
}

