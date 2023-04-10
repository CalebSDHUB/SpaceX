//
//  ServiceFactory.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 02.04.2023.
//

import Foundation

/// Responsible for creating a Service instance using the factory design pattern.
/// Activate -test in "Edit scheme -> Arguments" to use the MockService for unit test, instead of WebService.
final class ServiceFactory {
    private init() {}
    
    /// Creating instance depending on "Edit scheme -> Arguments" as mentioned
    static func create() -> Service {
        if let environment = ProcessInfo.processInfo.environment["-test"] {
                /// Test
            if environment == "TEST" {
                Constant.ResourceName.current = .file
                return MockWebservice.shared
                /// Production (other environment variable)
            } else {
                Constant.ResourceName.current = .web
                return Webservice.shared
            }
            /// Production (no environment variable selected)
        } else {
            Constant.ResourceName.current = .web
            return Webservice.shared
        }
    }
}
