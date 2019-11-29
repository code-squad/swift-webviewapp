//
//  ViewController.swift
//  WebviewApp
//
//  Created by 이동영 on 2019/11/29.
//  Copyright © 2019 이동영. All rights reserved.
//

import UIKit
import Then
import SnapKit

class WebViewController: UIViewController {
    
    // MARK: - UI
    
    private let webView = MyUIWebView(frame: .zero)
    
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
        webView.loadRequest(request)
    }
}

// MARK: - Layout & Attributes

extension WebViewController {
    private func setupAttributes() {
        self.view.do {
            $0.addSubview(webView)
        }
        webView.do {
            $0.delegate = self
        }
    }
    
    private func setupConstraints() {
        webView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

// MARK: - UIWebViewDelegate

extension WebViewController: UIWebViewDelegate {
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebView.NavigationType) -> Bool {
        print()
        print(request)
        print(navigationType)
        print(#function)
        return true
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        print()
        print(webView.request?.url)
        print(#function)
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print()
        print(#function)
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        print()
        print(#function)
    }
    
}
