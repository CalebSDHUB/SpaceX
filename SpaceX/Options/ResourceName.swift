//
//  ResourceName.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 10.04.2023.
//

enum ResourceName {
    case web, file
    
    var resourceName: String {
        switch self {
        case .web: return Constant.URL.spaceXapi
        case .file: return Constant.File.FileName.spaceXLaunch
        }
    }
}
