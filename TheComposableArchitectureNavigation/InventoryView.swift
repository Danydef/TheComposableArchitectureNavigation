//
//  InventoryView.swift
//  TheComposableArchitectureNavigation
//
//  Created by Daniel Personal on 24/9/23.
//

import SwiftUI
import ComposableArchitecture

struct InventoryFeature: Reducer {
    struct State: Equatable {}
    enum Action {}
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        
    }
}

struct InventoryView: View {
    let store: StoreOf<InventoryFeature>
    
    var body: some View {
        Text("Inventory")
    }
}

