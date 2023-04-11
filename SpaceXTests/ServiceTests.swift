//
//  SpaceXTests.swift
//  SpaceXTests
//
//  Created by Caleb Danielsen on 01.04.2023.
//

import XCTest
@testable import SpaceX

/// IMPORTANT: Remember to activate -test in "Edit scheme" to use the MockService for unit test, instead of WebService.for unit test.
/// The tests is only ment for the MockService, so failing to select -test will fail the test unwanted.
final class ServiceTests: XCTestCase {
    private var service: Service!

    override func setUp() {
        service = ServiceFactory.create()
    }
    override func tearDown() {}
    
    func test_mock_service_successful() async throws {
        let launchViewModels = try? await service.fetch(resourceName: Constant.File.FileName.spaceXLaunch)
        XCTAssertNotNil(launchViewModels)
    }
    
    func test_mock_service_falied() async {
        let launchViewModels = try? await service.fetch(resourceName: "wrong_resource_name")
        XCTAssertNil(launchViewModels)
    }
}
