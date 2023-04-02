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
    
    func fetch(resourceName: String) async -> [LaunchViewModel]? {
        do {
            let data = await HTTP.requestResponse(resourceName, statusCode: Constant.URL.statusCode.ok)
            guard let launchModels = Parse.decodeJSON(type: [LaunchModel].self, data: data) else { throw ParseError.parseJSONDecoderFailed }
            return launchModels.map(LaunchViewModel.init)
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
