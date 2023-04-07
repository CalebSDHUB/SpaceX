//
//  Welcome.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 02.04.2023.
//

import Foundation

struct LaunchModel: Decodable {
    let fairings: Fairings?
    let links: Links?
    let staticFireDateUTC: String?
    let staticFireDateUnix: Int?
    let net: Bool?
    let window: Int?
    let rocket: String?
    let success: Bool?
    let failures: [Failure?]
    let details: String?
    let ships: [String?]
    let capsules: [String?]
    let payloads: [String?]
    let launchpad: String?
    let flightNumber: Int?
    let name: String?
    var dateUTC: String?
    let dateUnix: Int?
    let dateLocal: String?
    let datePrecision: String?
    let upcoming: Bool?
    let cores: [Core?]
    let autoUpdate, tbd: Bool?
    let launchLibraryID: String? // NSNULL
    let id: String
    
    private enum CodingKeys: String, CodingKey {
        case fairings, links
        case staticFireDateUTC = "static_fire_date_utc"
        case staticFireDateUnix = "static_fire_date_unix"
        case net, window, rocket, success, failures, details
        case ships, capsules, payloads, launchpad
        case flightNumber = "flight_number"
        case name
        case dateUTC = "date_utc"
        case dateUnix = "date_unix"
        case dateLocal = "date_local"
        case datePrecision = "date_precision"
        case upcoming, cores
        case autoUpdate = "auto_update"
        case tbd
        case launchLibraryID = "launch_library_id"
        case id
    }
    
    struct Core: Decodable {
        let core: String?
        let flight: Int?
        let gridfins: Bool?
        let legs: Bool?
        let reused: Bool?
        let landingAttempt: Bool?
        let landingSuccess: Bool?
        let landingType: String?
        let landpad: String?
        
        private enum CodingKeys: String, CodingKey {
            case core, flight, gridfins, legs, reused
            case landingAttempt = "landing_attempt"
            case landingSuccess = "landing_success"
            case landingType = "landing_type"
            case landpad
        }
    }
    
    struct Failure: Decodable {
        let time: Int?
        let altitude: Int? // NSNULL
        let reason: String?
    }
    
    struct Fairings: Decodable {
        let reused: Bool?
        let recoveryAttempt: Bool?
        let recovered: Bool?
        let ships: [String?]
        
        private enum CodingKeys: String, CodingKey {
            case reused, recovered, ships
            case recoveryAttempt = "recovery_attempt"
        }
    }
    
    struct Links: Decodable {
        let patch: Patch?
        let reddit: Reddit?
        let flickr: Flickr?
        let presskit: String? // NSNULL
        let webcast: String?
        let youtubeID: String?
        let article: String?
        let wikipedia: String?
        
        private enum CodingKeys: String, CodingKey {
            case patch, reddit, flickr, presskit, webcast, article, wikipedia
            case youtubeID = "youtube_id"
        }
    }
    
    struct Flickr: Decodable {
        let small: [String?]
        let original: [String?]
    }
    
    struct Patch: Decodable {
        let small: String?
        let large: String?
    }
    
    struct Reddit: Decodable {
        let campaign: String?
        let launch: String?
        let media: String?
        let recovery: String?
    }
}


