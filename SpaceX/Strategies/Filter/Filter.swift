//
//  Filter.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 08.04.2023.
//

/// Responsible for setting and executing the current strategy using the Strategy Design Pattern
final class Filter {
    static private var strategy: FilterStrategy!
    private init() {}
    
    static func setStrategy(strategy: FilterStrategy) {
        self.strategy = strategy
    }
    
    static func executeStrategy(viewModels: [ViewModel], text: String) -> [ViewModel] {
        strategy.execute(viewModels: viewModels, text: text)
    }
}
