//
//  ManagerTest.swift
//  SpaceXTests
//
//  Created by Caleb Danielsen on 11.04.2023.
//

import XCTest
@testable import SpaceX

final class ManagerTest: XCTestCase {
    private var manager: Manager!
    
    override func setUp() {
        manager = Manager.shared
    }
    
    func test_manager_fetch_update_successfull() {
        manager.update()
        manager.update()
        guard let mockService = manager.service as? MockWebservice else { return }
        XCTAssertEqual(mockService.fetchCount, 2)
    }
    
    func test_manager_fetch_update_failed() {
        manager.update()
        guard let mockService = manager.service as? MockWebservice else { return }
        XCTAssertNotEqual(mockService.fetchCount, 2)
    }
}
