//
//  CreateProfileFlowReducer.swift
//  SwiftNavigationTest
//
//  Created by Ruslan Mansurov on 2/15/24.
//

import ComposableArchitecture

struct CreateProfileFlowReducer: Reducer {
    struct Step: Reducer {
        enum State {
            case intro(CreateProfileIntroStepReducer.State)
            case teams(CreateProfileTeamsStepReducer.State)
        }

        enum Action {
            case intro(CreateProfileIntroStepReducer.Action)
            case teams(CreateProfileTeamsStepReducer.Action)
        }

        var body: some ReducerOf<Self> {
            Scope(state: /State.intro, action: /Action.intro) {
                CreateProfileIntroStepReducer()
            }
            Scope(state: /State.teams, action: /Action.teams) {
                CreateProfileTeamsStepReducer()
            }
        }
    }

    struct State {
        /// Contains states for all views that are currently in the navigation stack
        var path = StackState<Step.State>()

        /// State for the initial (intro) view
        var root: CreateProfileIntroStepReducer.State = .init()
    }

    enum Action {
        case path(StackAction<Step.State, Step.Action>)
        case root(CreateProfileIntroStepReducer.Action)
    }

    var body: some ReducerOf<Self> {
        Reduce { _, action in
            switch action {
            case let .path(.element(id: id, action: .intro(.selectedItem))):
                print(id)
            default:
                break
            }
            return .none
        }
        .forEach(\.path, action: /Action.path) {
            Step()
        }
    }
}
