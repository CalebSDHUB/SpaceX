//
//  WebService.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 02.04.2023.
//

/// Responsible for fetching from REST end-point.
final class Webservice: Service {
    static let shared = Webservice()
    private init(){}
    
    /// Fetching JSON from REST ebd-point
    func fetch(resourceName: String) async throws -> [ViewModel] {
        let data = try await HTTP.requestResponse(resourceName, statusCode: Constant.URL.statusCode.ok)
        let launchModels = try Parser.decodeJSON(type: [LaunchModel].self, data: data)
        return launchModels.map(LaunchViewModel.init)
    }
}
