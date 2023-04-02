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
    static func readJSON<T: Decodable>(type: T.Type,  resourceName: String) -> T? {
        do {
            guard let url = Bundle.main.url(forResource: resourceName, withExtension: Constant.File.Format.json) else { throw ParseError.parseResourceNameToURLFailed }
            let data = try Data(contentsOf: url)
            return Parse.decodeJSON(type: T.self, data: data)
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
