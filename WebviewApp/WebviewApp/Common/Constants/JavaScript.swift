//
//  Source.swift
//  WebviewApp
//
//  Created by 이동영 on 2019/12/02.
//  Copyright © 2019 이동영. All rights reserved.
//

import Foundation

enum JavaScript {
    static let removeBanner =
    """
            var popup = document.querySelector('.part_banner');
        if (popup != null) {
            popup.style.display = 'none';
        }
    """
}
