//
//  Menu.swift
//  WebviewApp
//
//  Created by joon-ho kil on 9/3/19.
//  Copyright © 2019 길준호. All rights reserved.
//

import Foundation

struct Menus {
    var menus = [Menu]()

    init(body: Any) {
        if let array = body as? [Any] {
            for objects in array {
                let object = objects as? [Any]
                guard let text = object?.first else {
                    continue
                }
                guard let urlString = object?[1] else {
                    continue
                }
                menus.append(Menu(text: text as! String, urlString: urlString as! String))
            }
        }
    }
}

struct Menu {
    let text: String
    let urlString: String
}
