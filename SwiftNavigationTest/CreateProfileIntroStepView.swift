//
//  CreateProfileIntroStepView.swift
//  SwiftNavigationTest
//
//  Created by Ruslan Mansurov on 2/15/24.
//

import ComposableArchitecture
import Foundation
import SwiftUI

@available(iOS 16.0, *)
struct CreateProfileIntroStepView: View {
    let store: StoreOf<CreateProfileIntroStepReducer>

    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack {
                Text("Intro step, selected item: \(String(describing: viewStore.item))")
                Button("Select item") {
                    viewStore.send(.selectedItem("some item"))
                }
                NavigationLink(state: CreateProfileFlowReducer.Step.State.teams(.init())) {
                    Text("Go Next")
                }
            }
        }
    }
}
