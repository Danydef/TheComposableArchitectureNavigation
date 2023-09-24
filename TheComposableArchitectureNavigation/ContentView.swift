//
//  ContentView.swift
//  TheComposableArchitectureNavigation
//
//  Created by Daniel Personal on 24/9/23.
//

import SwiftUI
import ComposableArchitecture

struct AppFeature: Reducer {
    struct State: Equatable {
        var firstTab = FirstTabFeature.State()
        var inventory = InventoryFeature.State()
        var selectedTab: Tab = .one
        var thirdTab = ThirdTabFeature.State()
    }
    enum Action {
        case firstTab(FirstTabFeature.Action)
        case inventory(InventoryFeature.Action)
        case selectedTabChange(Tab)
        case thirdTab(ThirdTabFeature.Action)
    }
    
    var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .firstTab(.goToInventoryButtonTapped):
                state.selectedTab = .inventory
                return .none
                
            case let .selectedTabChange(tab):
                state.selectedTab = tab
                return .none
                
            case .inventory, .firstTab, .thirdTab:
                return .none
                
            }
        }
        Scope(state: \.firstTab, action: /Action.firstTab) {
            FirstTabFeature()
        }
        Scope(state: \.inventory, action: /Action.inventory) {
            InventoryFeature()
        }
        Scope(state: \.thirdTab, action: /Action.thirdTab) {
            ThirdTabFeature()
        }
    }
}

enum Tab {
    case one, inventory, three
}

struct ContentView: View {
    let store: StoreOf<AppFeature>
    
    var body: some View {
        WithViewStore(store, observe: \.selectedTab) { viewStore in
            TabView(
                selection: viewStore.binding(
                    send: AppFeature.Action.selectedTabChange
                )
            ) {
                
                FirstTabView(
                    store: store.scope(
                        state: \.firstTab,
                        action: AppFeature.Action.firstTab
                    )
                )
                .tabItem { Text("One") }
                .tag(Tab.one)
                
                InventoryView(
                    store: store.scope(
                        state: \.inventory,
                        action: AppFeature.Action.inventory
                    )
                )
                .tabItem { Text("Inventory") }
                .tag(Tab.inventory)
                
                ThirdTabView(
                    store: store.scope(
                        state: \.thirdTab,
                        action: AppFeature.Action.thirdTab
                    )
                )
                .tabItem { Text("Three") }
                .tag(Tab.three)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(
      store: Store(
        initialState: AppFeature.State()) {
            AppFeature()
        }
      )
  }
}
