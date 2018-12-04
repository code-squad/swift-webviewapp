//
//  Script.swift
//  
//
//  Created by oingbong on 04/12/2018.
//

import Foundation

struct Script {
    static let popupDisable = """
        var popup = document.querySelector('.app-download-popup');
        if (popup != null) {
            popup.style.display = 'none';
        }
        """
}
