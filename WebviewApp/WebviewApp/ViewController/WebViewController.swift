//
//  ViewController.swift
//  WebviewApp
//
//  Created by 이동영 on 2019/11/29.
//  Copyright © 2019 이동영. All rights reserved.
//

import UIKit
import WebKit
import Then
import SnapKit

class WebViewController: UIViewController {
    
    // MARK: - UI
    
    private let webView = WKWebView(frame: .zero)
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAttributes()
        setupConstraints()
        requestContents(from: Naver.Shopping.url)
    }
    
    // MARK: - Methods
    
    private func requestContents(from url: URL) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

// MARK: - Layout & Attributes

extension WebViewController {
    private func setupAttributes() {
        self.view.do {
            $0.addSubview(webView)
        }
        webView.do {
            $0.uiDelegate = self
            $0.navigationDelegate = self
        }
    }
    
    private func setupConstraints() {
        webView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

// MARK: - UIWebViewDelegate

extension WebViewController: WKUIDelegate {
    
}
extension WebViewController: WKNavigationDelegate {
    
}
