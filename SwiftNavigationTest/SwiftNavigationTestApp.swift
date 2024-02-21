//
//  SwiftNavigationTestApp.swift
//  SwiftNavigationTest
//
//  Created by Ruslan Mansurov on 2/21/24.
//

import SwiftUI
import ComposableArchitecture

@main
struct SwiftNavigationTestApp: App {
    var body: some Scene {
        WindowGroup {
            CreateProfileFlowView(store: .init(initialState: .init(), reducer: {
                CreateProfileFlowReducer()
            }))
        }
    }
}
