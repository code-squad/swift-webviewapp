//
//  ProgramDescription.swift
//  WebViewApp
//
//  Created by YOUTH2 on 2018. 6. 25..
//  Copyright © 2018년 JINiOS. All rights reserved.
//

import Foundation

enum ProgramDescription {
    case storeURL
    case slideMenu
    case searchPHP
    case injectionSource
    case js

    var value: String {
        switch self {
        case .storeURL: return "https://m.baeminchan.com"
        case .slideMenu: return "slideMenu"
        case .searchPHP: return "search.php"
        case .injectionSource: return "injectionsource"
        case .js: return "js"
        }
    }

}
