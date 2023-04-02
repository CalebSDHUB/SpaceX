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
//    let crew: [String?] // No go !!!
    let ships: [String?]
    let capsules: [String?]
    let payloads: [String?]
    let launchpad: String?
    let flightNumber: Int?
    let name: String?
    let dateUTC: String?
    let dateUnix: Int?
    let dateLocal: Date?
    let datePrecision: String?
    let upcoming: Bool?
    let cores: [Core?]
    let autoUpdate, tbd: Bool?
    let launchLibraryID: String? // NSNULL
    let id: String
    
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


