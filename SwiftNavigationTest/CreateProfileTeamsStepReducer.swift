//
//  CreateProfileTeamsStepReducer.swift
//  SwiftNavigationTest
//
//  Created by Ruslan Mansurov on 2/15/24.
//

import ComposableArchitecture
import Foundation

struct CreateProfileTeamsStepReducer: Reducer {
    struct State: Equatable {
        var team: String?
    }

    enum Action: Equatable {
        case selectedTeam(String)
    }

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case let .selectedTeam(team):
                state.team = team
                return .none
            }
        }
    }
}
