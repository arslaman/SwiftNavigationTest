//
//  CreateProfileIntroStepReducer.swift
//  SwiftNavigationTest
//
//  Created by Ruslan Mansurov on 2/15/24.
//

import ComposableArchitecture
import Foundation

struct CreateProfileIntroStepReducer: Reducer {
    struct State: Equatable {
        var item: String?
    }

    enum Action: Equatable {
        case selectedItem(String)
    }

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case let .selectedItem(item):
                state.item = item
                return .none
            }
        }
    }
}
