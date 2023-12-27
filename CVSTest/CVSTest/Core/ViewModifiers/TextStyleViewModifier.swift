//
//  TextStyleModifier.swift
//  CVSTest
//
//  Created by Саша Василенко on 26.12.2023.
//

import SwiftUI

enum TextStyle {
    case title, grayText
    
    var getStyleComponents: Font {
        switch self {
        case .title:
            return Font.system(size: CGFloatConstants.CGFloat20, weight: .bold, design: .default)
        case .grayText:
            return Font.system(size: CGFloatConstants.CGFloat15, weight: .regular)
        }
    }
}

struct TextStyleViewModifier: ViewModifier {
    let font: Font
    
    init(_ textStyle: TextStyle) {
        self.font = textStyle.getStyleComponents
    }
    
    func body(content: Content) -> some View {
        content.font(font)
    }
}
