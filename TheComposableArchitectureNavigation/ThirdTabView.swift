//
//  ThirdTabView.swift
//  TheComposableArchitectureNavigation
//
//  Created by Daniel Personal on 24/9/23.
//

import SwiftUI
import ComposableArchitecture

struct ThirdTabFeature: Reducer {
    struct State: Equatable {}
    enum Action {}
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        
    }
}

struct ThirdTabView: View {
    let store: StoreOf<ThirdTabFeature>
    
    var body: some View {
        Text("Three")
    }
}
