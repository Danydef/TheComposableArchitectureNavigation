//
//  TheComposableArchitectureNavigationTests.swift
//  TheComposableArchitectureNavigationTests
//
//  Created by Daniel Personal on 24/9/23.
//

import XCTest
import ComposableArchitecture
@testable import TheComposableArchitectureNavigation

@MainActor
final class TheComposableArchitectureNavigationTests: XCTestCase {

    func testGoToInventory() async {
        let store = TestStore(
            initialState: AppFeature.State(),
            reducer: { AppFeature() }
        )
        
        await store.send(.firstTab(.goToInventoryButtonTapped)) {
            $0.selectedTab = .inventory
        }
    }
   
    func testDelete() async {
        let item = Item.headphones

        let store = TestStore(
          initialState: InventoryFeature.State(items: [item]),
          reducer: { InventoryFeature() }
        )
        
        await store.send(.deleteButtonTapped(id: item.id)) {
            $0.alert = .delete(item: item)
        }
        
        await store.send(.alert(.presented(.confirmDeletion(id: item.id)))) {
            $0.items = []
        }
    }
    
    func testDuplicate() async {
        let item = Item.headphones
        
        let store = TestStore(
            initialState: InventoryFeature.State(items: [item]),
            reducer:  { InventoryFeature() }
        ) {
            $0.uuid = .incrementing
        }
        
        await store.send(.duplicateButtonTapped(id: item.id)) {
            $0.confirmationDialog = .duplicate(item: item)
        }
        
        await store.send(.confirmationDialog(.presented(.confirmDuplicate(id: item.id)))) {
            $0.items = [
                Item(id: UUID(uuidString: "00000000-0000-0000-0000-000000000000"), name: item.name, color: item.color, status: item.status),
                item
            ]
        }
    }
}
