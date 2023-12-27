//
//  CVSTestApp.swift
//  CVSTest
//
//  Created by Саша Василенко on 20.12.2023.
//

import SwiftUI
import ComposableArchitecture

@main
struct CVSTestApp: App {
    var body: some Scene {
        WindowGroup {
            MainScreenView(store: Store(initialState: MainScreenFeature.State(), reducer: {
                MainScreenFeature()
            }))
        }
    }
}
