//
//  TextStyleModifier.swift
//  CVSTest
//
//  Created by Саша Василенко on 26.12.2023.
//

import SwiftUI

enum TextStyle {
    case title, regular
    
    var getStyleComponents: (Font) {
        switch self {
        case .title:
            return .system(size: CGFloatConstants.CGFloat20, weight: .bold)
        case .regular:
            return .system(size: CGFloatConstants.CGFloat15, weight: .regular)
        }
    }
}
