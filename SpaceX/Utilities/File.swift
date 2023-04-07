//
//  File.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 02.04.2023.
//

import Foundation

/// Responsible for reading files
final class File {
    private init() {}
    /// Read JSON file
    static func readJSON<T: Decodable>(type: T.Type,  resourceName: String) throws -> T {
            guard let url = Bundle.main.url(forResource: resourceName, withExtension: Constant.File.Format.json) else { throw ParseError.parseStringToURLFailed }
            let data = try Data(contentsOf: url)
            return try Parser.decodeJSON(type: T.self, data: data)
    }
}
