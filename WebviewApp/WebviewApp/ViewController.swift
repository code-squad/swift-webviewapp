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
    var webview: WKWebView!
    override func loadView() {
        super.loadView()
        
        var content = ""
        if let path = Bundle.main.path(forResource: "Script", ofType: "js") {
            do {
                content = try String(contentsOfFile: path)
            } catch {
                content = Key.alert(with: "에러가 발생하였습니다.")
            }
        }
        
        let webConfiguration = WKWebViewConfiguration()
        let userScript = WKUserScript(source: content, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        let contentController = WKUserContentController()
        contentController.addUserScript(userScript)
        webConfiguration.userContentController = contentController
        webview = WKWebView(frame: .zero, configuration: webConfiguration)
        view = webview
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webview.uiDelegate = self
        guard let url = URL(string: Key.url) else { return }
        let request = URLRequest(url: url)
        webview.load(request)
    }
}

extension ViewController: WKUIDelegate {
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: Key.alertTitle, style: .cancel) { _ in
            completionHandler()
        }
        alertController.addAction(cancelAction)
        DispatchQueue.main.async {
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
