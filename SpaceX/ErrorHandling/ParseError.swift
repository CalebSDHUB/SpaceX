//
//  ParseError.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 02.04.2023.
//

enum ParseError: Error {
    case parseJSONDecoderFailed
    case parseResourceNameToURLFailed
    case parseURLToDataFailed
}
