//
//  Navigation.swift
//  TheComposableArchitectureNavigation
//
//  Created by Daniel Personal on 25/9/23.
//

import ComposableArchitecture

extension Reducer {
    func alert<AlertAction>(
        state alertKeyPath: WritableKeyPath<State, AlertState<AlertAction>?>,
        action alertCasePath: CasePath<Action, AlertAction>
    ) -> some ReducerOf<Self> {
        Reduce { state, action in
            let effects = self.reduce(into: &state, action: action)
            if alertCasePath ~= action {
                state[keyPath: alertKeyPath] = nil
            }
            return effects
        }
    }
}
