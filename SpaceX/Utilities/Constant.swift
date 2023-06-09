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
        
        struct FileName {
            static let spaceXLaunch = "spacex-launch"
        }
    }
    
    struct ResourceName {
        static var current: ResourceNameOption = .web
    }
    
    struct LaunchScreen {
        struct Title {
            static let name = "SpaceX Launch"
        }
        
        struct Cell {
            static let identifier = "launch_screen_cell"
        }
        
        struct NavigationItemButton {
            static let title = "Sort by"
            static let date = "Date"
            static let name = "Name"
        }
        
        struct Sleep {
            static let time = 3000
        }
    }
    
    struct StartScreen {
        static let spaceX = "SPACEX"
        static let fontSize: CGFloat = 50
        static let switchScreenDelay = 3000
    }
    
    struct View {
        struct Logo {
            static let smallFormat: CGFloat = 25
            static let bigFormat: CGFloat = 100
        }
        
        struct Status {
            static let failure = "Failure"
            static let success = "Success"
            
            static let smallFormat: CGFloat = 16
            static let bigFormat: CGFloat = 18
        }
        
        struct Detail {
            static let sectionMission = "Mission"
            static let sectionFailureReason = "Failure reasons"
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
        static let parseStringToURLFailedMessage = "Using wrong URL"
    }
    
    struct WebManagerDelegate {
        static let updated = "Updating..."
    }
    
    struct BackgroundImage {
        static let name = "spacex-launch-background"
    }
}
