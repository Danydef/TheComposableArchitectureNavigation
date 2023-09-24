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
   

}
