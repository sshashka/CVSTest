//
//  View+Extension.swift
//  CVSTest
//
//  Created by Саша Василенко on 26.12.2023.
//

import SwiftUI

extension View {
    func applyTextStyle(_ textStyle: TextStyle) -> some View {
        modifier(TextStyleViewModifier(textStyle))
    }
}
