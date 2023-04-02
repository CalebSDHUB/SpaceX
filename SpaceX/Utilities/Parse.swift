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
    static func decodeJSON<T: Decodable>(type: T.Type, data: Data?) -> T? {
        do {
            guard let data else { return nil }
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            print("Error: \(error.localizedDescription)")
            return nil
        }
    }
}