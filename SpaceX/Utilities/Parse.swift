//
//  Parse.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 02.04.2023.
//

import Foundation

/// Responsible for parsing data
final class Parse {
    private init() {}
    /// Parsing JSON data into Swift type
    static func decodeJSON<T: Decodable>(type: T.Type, data: Data) throws -> T? {
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw ParseError.parseJSONDecoderFailed
        }
    }
}
