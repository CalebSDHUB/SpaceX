//
//  Welcome.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 02.04.2023.
//

import Foundation

struct LaunchModel {
    let fairings: Fairings?
    let links: Links?
    let staticFireDateUTC: String?
    let staticFireDateUnix: Int?
    let net: Bool?
    let window: Int?
    let rocket: String?
    let success: Bool
    let failures: [Failure?]
    let details: String?
    let crew: [String?]
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
    let launchLibraryID: NSNull?
    let id: String
    
    struct Core {
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

    struct Failure {
        let time: Int?
        let altitude: NSNull?
        let reason: String?
    }

    struct Fairings {
        let reused: Bool?
        let recoveryAttempt: Bool?
        let recovered: Bool?
        let ships: [String?]
    }

    struct Links {
        let patch: Patch?
        let reddit: Reddit?
        let flickr: Flickr?
        let presskit: NSNull?
        let webcast: String?
        let youtubeID: String?
        let article: String?
        let wikipedia: String?
    }

    struct Flickr {
        let small: [String?]
        let original: [String?]
    }

    struct Patch {
        let small: String?
        let large: String?
    }

    struct Reddit {
        let campaign: String?
        let launch: String?
        let media: String?
        let recovery: String?
    }
}


