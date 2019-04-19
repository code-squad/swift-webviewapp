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
}
