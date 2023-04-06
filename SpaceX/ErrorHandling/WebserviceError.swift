//
//  WebserviceError.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 02.04.2023.
//

import Foundation

enum WebserviceError: LocalizedError {
    case badResponse
    
    var errorDescription: String? {
        switch self {
        case .badResponse: return Constant.Error.badResponseMessage
        }
    }
}
