//
//  FirstTab.swift
//  TheComposableArchitectureNavigation
//
//  Created by Daniel Personal on 24/9/23.
//

import SwiftUI
import ComposableArchitecture

struct FirstTabFeature: Reducer {
    struct State: Equatable {}
    enum Action {
        case goToInventoryButtonTapped
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .goToInventoryButtonTapped:
            return .none
        }
    }
}

struct FirstTabView: View {
    let store: StoreOf<FirstTabFeature>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            Button {
                viewStore.send(.goToInventoryButtonTapped)
            } label: {
                Text("Go to inventory tab")
            }
        }
    }
}
