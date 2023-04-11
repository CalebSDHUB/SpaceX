//
//  Strategy.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 07.04.2023.
//

protocol SortStrategy {
    func execute(viewModels: [ViewModel]) -> [ViewModel]
}
