//
//  Keyword.swift
//  WebViewApp
//
//  Created by TaeHyeonLee on 2018. 4. 3..
//  Copyright © 2018년 ChocOZerO. All rights reserved.
//

import Foundation

enum Keyword {
    case baeminchanURL
    case jsFileName
    case js
    case search
    case clickEvent

    var value: String {
        switch self {
        case .baeminchanURL: return "https://m.baeminchan.com"
        case .jsFileName: return "Injection"
        case .js: return "js"
        case .search: return "search.php"
        case .clickEvent: return "clickEvent"
        }
    }
}
