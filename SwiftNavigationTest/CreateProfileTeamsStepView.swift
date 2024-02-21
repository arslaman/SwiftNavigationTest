//
//  CreateProfileTeamsStepView.swift
//  SwiftNavigationTest
//
//  Created by Ruslan Mansurov on 2/15/24.
//

import ComposableArchitecture
import Foundation
import SwiftUI

@available(iOS 16.0, *)
struct CreateProfileTeamsStepView: View {
    let store: StoreOf<CreateProfileTeamsStepReducer>

    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack {
                Text("Teams Screen. Selected team: \(String(describing: viewStore.team))")
                Button("Select team") {
                    viewStore.send(.selectedTeam("some team"))
                }
            }
        }
    }
}
