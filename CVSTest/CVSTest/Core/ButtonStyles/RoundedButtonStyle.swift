//
//  RoundedButtonModifier.swift
//  CVSTest
//
//  Created by Саша Василенко on 27.12.2023.
//

import SwiftUI

struct RoundedButtonStyle: ButtonStyle {
    let backgroundColor: Color
    
    init(backgroundColor: Color) {
        self.backgroundColor = backgroundColor
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: .zero, maxWidth: .infinity)
            .padding(CGFloatConstants.CGFloat10)
            .foregroundStyle(Color.black)
            .background(backgroundColor)
            .applyTextStyle(.grayText)
            .cornerRadius(CGFloatConstants.CGFloat25)
            .contentShape(RoundedRectangle(cornerRadius: CGFloatConstants.CGFloat25))
    }
}
