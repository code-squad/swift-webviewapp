//
//  containerView.swift
//  WebviewApp
//
//  Created by joon-ho kil on 8/28/19.
//  Copyright © 2019 길준호. All rights reserved.
//

import UIKit

class containerView: UIView {
    override func draw(_ rect: CGRect) {
        let source = "var popup = document.querySelector('.part_banner'); if (popup != null) { popup.style.display = 'none'; }"
        let userScript = WKUserScript.init(source: source, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        
        let contentController = WKUserContentController.init()
        contentController.addUserScript(userScript)
        
        let config = WKWebViewConfiguration()
        config.userContentController = contentController
        self.webView = WKWebView(frame: webView.bounds, configuration: config)
        
        let request = URLRequest(url: url!)
        webView.load(request)
    }

}
