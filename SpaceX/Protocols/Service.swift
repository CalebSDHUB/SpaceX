//
//  Service.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 02.04.2023.
//

protocol Service {
    func fetch(resourceName: String) async throws -> [LaunchViewModel]?
}
