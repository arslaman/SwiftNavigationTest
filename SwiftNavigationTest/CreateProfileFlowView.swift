//
//  CreateProfileFlowView.swift
//  SwiftNavigationTest
//
//  Created by Ruslan Mansurov on 2/15/24.
//

import ComposableArchitecture
import Foundation
import SwiftUI

@available(iOS 16.0, *)
struct CreateProfileFlowView: View {
    let store: StoreOf<CreateProfileFlowReducer>

    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStackStore(
            self.store.scope(state: \.path, action: { .path($0) })
        ) {
            CreateProfileIntroStepView(store: self.store.scope(
                state: \.root,
                action: { .root($0) }
            ))
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text(verbatim: "Close")
                    }
                }
            }
        } destination: { state in
            switch state {
            case .intro:
                CaseLet(
                    /CreateProfileFlowReducer.Step.State.intro,
                     action: { CreateProfileFlowReducer.Step.Action.intro($0) }
                ) { store in
                    CreateProfileIntroStepView(store: store)
                }
            case .teams:
                CaseLet(
                    /CreateProfileFlowReducer.Step.State.teams,
                     action: { CreateProfileFlowReducer.Step.Action.teams($0) }
                ) { store in
                    CreateProfileTeamsStepView(store: store)
                }
            }
        }
    }
}
