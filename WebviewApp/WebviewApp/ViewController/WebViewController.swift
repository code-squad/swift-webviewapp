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
    func webViewDidClose(_ webView: WKWebView) {
        print(#function)
        print("Notifies your app that the DOM window closed successfully.")
        print()
    }
    func webView(_ webView: WKWebView, contextMenuDidEndForElement elementInfo: WKContextMenuElementInfo) {
        print(#function)
        print()
    }
    func webView(_ webView: WKWebView, contextMenuWillPresentForElement elementInfo: WKContextMenuElementInfo) {
        print(#function)
        print()
    }
    func webView(_ webView: WKWebView,
                 runJavaScriptAlertPanelWithMessage message: String,
                 initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        print(#function)
        print("Displays a JavaScript alert panel.")
        completionHandler()
        print()
    }
    func webView(_ webView: WKWebView,
                 contextMenuForElement elementInfo: WKContextMenuElementInfo,
                 willCommitWithAnimator animator: UIContextMenuInteractionCommitAnimating) {
        print(#function)
        print()
    }
    func webView(_ webView: WKWebView,
                 runJavaScriptConfirmPanelWithMessage message: String,
                 initiatedByFrame frame: WKFrameInfo,
                 completionHandler: @escaping (Bool) -> Void) {
        print(#function)
        print("Displays a JavaScript confirm panel.")
        completionHandler(true)
        print()
    }
    func webView(_ webView: WKWebView,
                 contextMenuConfigurationForElement elementInfo: WKContextMenuElementInfo,
                 completionHandler: @escaping (UIContextMenuConfiguration?) -> Void) {
        print(#function)
        completionHandler(UIContextMenuConfiguration())
        print()
    }
    func webView(_ webView: WKWebView,
                 createWebViewWith configuration: WKWebViewConfiguration,
                 for navigationAction: WKNavigationAction,
                 windowFeatures: WKWindowFeatures) -> WKWebView? {
        print(#function)
        print("Creates a new web view.")
        print(configuration)
        print()
        return webView
    }
    func webView(_ webView: WKWebView,
                 runJavaScriptTextInputPanelWithPrompt prompt: String,
                 defaultText: String?,
                 initiatedByFrame frame: WKFrameInfo,
                 completionHandler: @escaping (String?) -> Void) {
        print(#function)
        print("Displays a JavaScript text input panel.")
        completionHandler("ㅎ ㅡ ㅎ")
        print()
    }
    func webView(_ webView: WKWebView, shouldPreviewElement elementInfo: WKPreviewElementInfo) -> Bool {
        print(#function)
        print("Determines whether the given element should show a preview.")
        print()
        return true
    }
    func webView(_ webView: WKWebView, commitPreviewingViewController previewingViewController: UIViewController) {
        print(#function)
        print("Called when the user performs a pop action on the preview.")
        print()
    }
    func webView(_ webView: WKWebView,
                 previewingViewControllerForElement elementInfo: WKPreviewElementInfo,
                 defaultActions previewActions: [WKPreviewActionItem]) -> UIViewController? {
        print(#function)
        print("Called when the user performs a peek action.")
        print()
        return self
    }
}
extension WebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print(#function)
        print("Called when the web view begins to receive web content.")
        print()
    }
    func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        print(#function)
        print("Called when the web view’s web content process is terminated.")
        print()
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print(#function)
        webView
            .configuration
            .websiteDataStore
            .do {
                print($0.httpCookieStore)
                print($0.isPersistent)
        }
        print("Called when the navigation is complete.")
        print(webView.configuration.userContentController.userScripts.first?.source)
        print()
    }
    func webView(_ webView: WKWebView,
                 didStartProvisionalNavigation navigation: WKNavigation!) {
        print(#function)
        print("Called when web content begins to load in a web view.")
        webView.configuration.userContentController.userScripts.forEach { print($0.source) }
        print()
    }
    func webView(_ webView: WKWebView,
                 didFail navigation: WKNavigation!,
                 withError error: Error) {
        print(#function)
        print()
    }
    func webView(_ webView: WKWebView,
                 didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        print(#function)
        print("Called when an error occurs during navigation.")
        print()
    }
    func webView(_ webView: WKWebView,
                 didFailProvisionalNavigation navigation: WKNavigation!,
                 withError error: Error) {
        print(#function)
        print("Called when an error occurs while the web view is loading content.")
        print()
    }
    func webView(_ webView: WKWebView,
                 didReceive challenge: URLAuthenticationChallenge,
                 completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        print(#function)
        print("Called when the web view needs to respond to an authentication challenge.")
        print()
        completionHandler(.useCredential, .none)
    }
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationAction: WKNavigationAction,
                 decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        print(#function)
        print("Decides whether to allow or cancel a navigation.")
        print()
        decisionHandler(.allow)
    }
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationResponse: WKNavigationResponse,
                 decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        print(#function)
        print("Decides whether to allow or cancel a navigation after its response is known.")
        print(navigationResponse.canShowMIMEType)
        print(navigationResponse.isForMainFrame)
        print(navigationResponse.response)
        decisionHandler(.allow)
        print()
    }
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationAction: WKNavigationAction,
                 preferences: WKWebpagePreferences,
                 decisionHandler: @escaping (WKNavigationActionPolicy, WKWebpagePreferences) -> Void) {
        print(#function)
        print(navigationAction)
        print()
        decisionHandler(.allow,preferences)
    }
}
