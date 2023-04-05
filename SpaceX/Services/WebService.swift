//
//  WebService.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 02.04.2023.
//

import Foundation

/// Responsible for fetching from server
final class Webservice: Service {
    static let shared = Webservice()
    private init(){}
    
    func fetch(resourceName: String) async throws -> [ViewModel] {
        let data = try await HTTP.requestResponse(resourceName, statusCode: Constant.URL.statusCode.ok)
        let launchModels = try Parser.decodeJSON(type: [LaunchModel].self, data: data)
        return launchModels.map(LaunchViewModel.init)
    }
}
