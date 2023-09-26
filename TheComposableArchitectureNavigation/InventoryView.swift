//
//  InventoryView.swift
//  TheComposableArchitectureNavigation
//
//  Created by Daniel Personal on 24/9/23.
//

import SwiftUI
import ComposableArchitecture

struct InventoryFeature: Reducer {
    struct State: Equatable {
        var items: IdentifiedArrayOf<Item> = []
        @PresentationState var alert: AlertState<Action.Alert>?
    }
    enum Action: Equatable {
        case deleteButtonTapped(id: Item.ID)
        case alert(PresentationAction<Alert>)
        
        enum Alert: Equatable {
            case confirmDeletion(id: Item.ID)
        }
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case let .deleteButtonTapped(id: id):
            guard let item = state.items[id: id] else {
                return .none
            }
            state.alert = .delete(item: item)
            return.none
        case let .alert(.presented(.confirmDeletion(id: id))):
            state.items.remove(id: id)
            return .none
        case .alert:
            return .none
        }
    }
}

extension AlertState
where Action == InventoryFeature.Action.Alert {
    static func delete(item: Item) -> Self {
        return AlertState {
            TextState(#"Delete "\#(item.name)""#)
        } actions: {
            ButtonState(
                role: .destructive,
                action: .send(
                    .confirmDeletion(id: item.id),
                    animation: .default
                )
            ) {
                TextState("Delete")
            }
        } message: {
            TextState(
                "Are you sure you want to delete this item?"
            )
        }
    }
}

struct InventoryView: View {
    let store: StoreOf<InventoryFeature>
    
    var body: some View {
        WithViewStore(
            store,
            observe: \.items
        ) { viewStore in
            List {
                ForEach(viewStore.state) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                            
                            switch item.status {
                            case let .inStock(quantity):
                                Text("In stock: \(quantity)")
                            case let .outOfStock(isOnBackOrder):
                                Text("Out of stock\(isOnBackOrder ? ": on back order" : "")")
                            }
                        }
                        
                        Spacer()
                        
                        if let color = item.color {
                            Rectangle()
                                .frame(width: 30, height: 30)
                                .foregroundColor(color.swiftUIColor)
                                .border(.black, width: 1)
                        }
                        
                        Button {
                            viewStore.send(.deleteButtonTapped(id: item.id))
                        } label: {
                            Image(systemName: "trash.fill")
                        }
                        .padding(.leading)
                    }
                    .buttonStyle(.plain)
                    .foregroundColor(
                        item.status.isInStock ? nil : Color.gray
                    )
                }
            }
        }
        .alert(
            store: store.scope(
                state: \.$alert,
                action: { .alert($0) }
            )
        )

    }
}

struct Inventory_Previews: PreviewProvider {
    static var previews: some View {
        InventoryView(
            store: Store(
                initialState: InventoryFeature.State(
                    items: [
                        .headphones,
                        .mouse,
                        .monitor,
                        .keyboard
                    ]
                ), reducer: {
                    InventoryFeature()
                }
            )
        )
    }
}
