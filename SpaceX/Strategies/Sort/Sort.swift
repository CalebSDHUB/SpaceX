//
//  ActionAlert.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 07.04.2023.
//

/// Responsible for setting and executing the current sorting strategy using the Strategy Design Pattern
final class Sort {
    static private var strategy: SortStrategy!
    private init() {}
    
    static func setStrategy(strategy: SortStrategy) {
        self.strategy = strategy
    }
    
    static func executeStrategy(viewModels: [ViewModel]) -> [ViewModel] {
        strategy.execute(viewModels: viewModels)
    }
}
