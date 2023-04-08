//
//  FilterStrategy.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 08.04.2023.
//

protocol FilterStrategy {
    func execute(viewModels: [ViewModel], text: String) -> [ViewModel]
}
