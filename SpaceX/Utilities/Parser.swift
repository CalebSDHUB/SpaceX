//
//  Parse.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 02.04.2023.
//

import Foundation

/// Responsible for parsing data
final class Parser {
    private init() {}
    /// Parsing JSON data into Swift type
    static func decodeJSON<T: Decodable>(type: T.Type, data: Data?) throws -> T? {
            guard let data else { return nil }
            return try JSONDecoder().decode(T.self, from: data)
    }
}
