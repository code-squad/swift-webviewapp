//
//  WKUserScript+.swift
//  WebviewApp
//
//  Created by 이동영 on 2019/12/02.
//  Copyright © 2019 이동영. All rights reserved.
//

import Foundation
import WebKit

extension WKUserScript {
    static let removeBanner = WKUserScript(source: JavaScript.removeBanner,
                                           injectionTime: .atDocumentEnd,
                                           forMainFrameOnly: true)
}
