//
//  ActionAlert.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 07.04.2023.
//

/// Responsible for setting and executing the current strategy using the Strategy Design Pattern
final class Sort {
    static private var strategy: Strategy!
    private init() {}
    
    static func setStrategy(strategy: Strategy) {
        self.strategy = strategy
    }
    
    static func executeStrategy(viewModels: [ViewModel]) -> [ViewModel] {
        strategy.execute(viewModels: viewModels)
    }
}
