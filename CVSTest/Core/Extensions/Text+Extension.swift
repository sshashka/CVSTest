//
//  Text+Extension.swift
//  CVSTest
//
//  Created by Саша Василенко on 27.12.2023.
//

import SwiftUI

extension Text {
     func applyStyle(_ textStyle: TextStyle) -> Text {
         self.font(textStyle.getStyleComponents)
    }
}
