//
//  JavaScriptSource.swift
//  WebviewApp
//
//  Created by 조재흥 on 19. 4. 19..
//  Copyright © 2019 hngfu. All rights reserved.
//

import Foundation

struct JavaScriptSource {
    static func displayNone(of querySelector: String) -> String {
        return """
        var popup = document.querySelector('\(querySelector)');
        if (popup != null) {
            popup.style.display = 'none';
        }
        """
    }
    
    static func menuList(of querySelector: String, handlerName: String) -> String {
        return """
        function menuList() {
        const menu = document.querySelector('\(querySelector)');
        const menuLists = Array.from(menu.children);
        let jsonArray = [];
        for (const menuList of menuLists) {
        let jsonInfo = {};
        jsonInfo['title'] = menuList.innerText;
        jsonInfo['urlString'] = menuList.firstElementChild.href;
        jsonArray.push(jsonInfo);
        }
        return jsonArray;
        }
        webkit.messageHandlers.\(handlerName).postMessage(menuList());
        """
    }
}
