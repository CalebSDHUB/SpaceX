//
//  ParseError.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 02.04.2023.
//

import Foundation

enum ParseError: LocalizedError {
    case dataFailed
    case parseStringToURLFailed
    
    var errorDescription: String? {
        switch self {
        case .dataFailed: return Constant.Error.dataFailedMessage
        case .parseStringToURLFailed: return Constant.Error.parseStringToURLFailedMessage
        }
    }
}
