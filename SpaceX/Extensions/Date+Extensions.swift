//
//  Date+Extensions.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 02.04.2023.
//

import Foundation

extension Date {
    static func unix(_ time: Int) -> String {
        Date(timeIntervalSince1970: TimeInterval(time)).formatted(date: .abbreviated, time: .complete)
    }
}
