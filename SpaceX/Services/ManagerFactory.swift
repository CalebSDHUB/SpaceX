//
//  ManagerFactory.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 04.04.2023.
//

/// Responsible for creating a Manager instance using the factory design pattern.
final class ManagerFactory {
    private init() {}
    
    /// Ready for more future managers
    static func create() -> Manager {
        WebManager.shared
    }
}
