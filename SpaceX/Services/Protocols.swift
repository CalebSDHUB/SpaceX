//
//  Service.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 02.04.2023.
//

protocol Service {
    func fetch(resourceName: String) async throws -> [ViewModel]
}

protocol WebManagerDelegate {
    func update(viewModels: [ViewModel])
}

protocol Manager {}
protocol ViewModel {}

