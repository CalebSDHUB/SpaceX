//
//  HTTP.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 02.04.2023.
//

import Foundation

/// Responsible for handling the HTTP
final class HTTP {
    private init() {}
    
    /// Sending the HTTP request to the server and receives HTTP response with valid data, if the status code is valid.
    static func requestResponse(_ urlAddress: String, statusCode: Int) async throws -> Data? {
        guard let url = URL(string: urlAddress) else { throw ParseError.parseStringToURLFailed }
            let (data, response) = try await URLSession.shared.data(from: url)
            try checkStatusCode(response: response, statusCode: statusCode)
            return data
    }
    
    /// Checking the desired status-code
    private static func checkStatusCode(response: URLResponse, statusCode: Int) throws {
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == statusCode
        else { throw WebserviceError.badResponse }
    }
}
