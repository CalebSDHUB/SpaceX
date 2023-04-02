//
//  ServiceFactory.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 02.04.2023.
//

import Foundation

/// Responsible for creating WebService or MockService instance using the factory design pattern.
/// Activate -test in "Edit scheme -> Arguments" to use the MockService for unit test, instead of WebService.
class ServiceFactory {
    private init() {}
    
    static func create() -> Service {
        if let environment = ProcessInfo.processInfo.environment["-test"] {
                /// Test
            if environment == "TEST" {
                return MockWebservice.shared
                /// Production (other environment variable)
            } else {
                return Webservice.shared
            }
            /// Production (no environment variable selected)
        } else {
            return Webservice.shared
        }
    }
}
