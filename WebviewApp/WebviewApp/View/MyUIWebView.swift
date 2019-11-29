//
//  MyUIWebView.swift
//  WebviewApp
//
//  Created by 이동영 on 2019/11/30.
//  Copyright © 2019 이동영. All rights reserved.
//

import UIKit

class MyUIWebView: UIWebView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        print()
        print(#function)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadRequest(_ request: URLRequest) {
        super.loadRequest(request)
        
        print()
        print(#function)
    }
    
    override func loadHTMLString(_ string: String, baseURL: URL?) {
        super.loadHTMLString(string, baseURL: baseURL)
        
        print()
        print(#function)
    }
    
    override func load(_ data: Data, mimeType MIMEType: String, textEncodingName: String, baseURL: URL) {
        super.load(data, mimeType: MIMEType, textEncodingName: textEncodingName, baseURL: baseURL)
        
        print()
        print(#function)
    }
    
    override func goBack() {
        super.goBack()
        
        print()
        print(#function)
    }
    
    override func goForward() {
        super.goForward()
        
        print()
        print(#function)
    }
    
}

// MARK: - UIWebView.NavigationType

extension UIWebView.NavigationType: CustomStringConvertible {
    
    public var description: String {
        switch self {
        case .linkClicked: return "linkClicked"
        case .formSubmitted: return "formSubmitted"
        case .backForward: return "backFˆorward"
        case .reload: return "reload"
        case .formResubmitted: return "formResubmitted"
        case .other: return "other"
        }
    }
}
