//
//  Key.swift
//  WebviewApp
//
//  Created by oingbong on 04/12/2018.
//  Copyright © 2018 oingbong. All rights reserved.
//

import Foundation

struct Key {
    static let url = "https://m.baeminchan.com"
    static let alertTitle = "OK"
    static func alert(with message: String) -> String {
        return "alert('\(message)')"
    }
}
