//
//  Constant.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 02.04.2023.
//

struct Constant {
    struct URL {
        struct statusCode {
            static let ok = 200
        }
        static let spaceX = "https://api.spacexdata.com/v5/launches"
    }
    
    struct File {
        struct Format {
            static let json = "json"
        }
        
        struct ResourceName {
            static let spaceXLaunch = "spaceXLaunch"
        }
    }
}
