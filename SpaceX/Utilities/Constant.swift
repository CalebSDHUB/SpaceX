//
//  Constant.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 02.04.2023.
//

import Foundation

struct Constant {
    struct URL {
        struct statusCode {
            static let ok = 200
        }
        static let spaceXapi = "https://api.spacexdata.com/v5/launches"
    }
    
    struct File {
        struct Format {
            static let json = "json"
        }
        
        struct ResourceName {
            static let spaceXLaunch = "spacex-launch"
        }
    }
    
    struct LaunchScreen {
        struct Title {
            static let name = "SpaceX Launches"
        }
        
        struct Cell {
            static let identifier = "launch_screen_cell"
        }
    }
    
    struct View {
        struct Logo {
            static let smallFormat: CGFloat = 25
            static let bigFormat: CGFloat = 150
        }
        
        struct Status {
            static let failure = "Failure"
            static let success = "Success"
        }
        
        struct Detail {
            static let sectionMission = "Mission"
            static let sectionFailureReason = "Failure reason"
            static let sectionFailureDetails = "Failure details"
            
            static let iconPlay = "play.rectangle.fill"
            static let iconNewspaper = "newspaper.fill"
            static let iconWikipedia = "W"
            
            static let linkWebcast = "Webcast"
            static let linkArticle = "Article"
            static let linkWikipedia = "Wikipedia"
        }
    }
    
    struct Default {
        static let string = "n/a"
        static let systemImage = "photo"
    }
    
    struct Error {
        static let badResponseMessage = "Bad response from the server"
        static let dataFailedMessage = "Data failed to unwrap"
        static let parseResourceNameToURLFailedMessage = "Resource name failed to parse into URL"
    }
}
