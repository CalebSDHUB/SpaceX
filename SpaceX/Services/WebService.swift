//
//  WebService.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 02.04.2023.
//

import Foundation

final class Webservice: Service {
    static let shared = Webservice()
    private init(){}
    
    func fetch(resourceName: String) async throws -> [LaunchViewModel] {
        let data = try await HTTP.requestResponse(resourceName, statusCode: Constant.URL.statusCode.ok)
        guard let launchModels = try Parser.decodeJSON(type: [LaunchModel].self, data: data) else { throw ParseError.parseJSONDecoderFailed }
        return launchModels.map(LaunchViewModel.init)
    }
}
