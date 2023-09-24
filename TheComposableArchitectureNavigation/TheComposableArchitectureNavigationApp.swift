//
//  TheComposableArchitectureNavigationApp.swift
//  TheComposableArchitectureNavigation
//
//  Created by Daniel Personal on 24/9/23.
//

import SwiftUI
import ComposableArchitecture

@main
struct TheComposableArchitectureNavigationApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(
              store: Store(
                initialState: AppFeature.State()) {
                    AppFeature()
                }
              )
        }
    }
}
