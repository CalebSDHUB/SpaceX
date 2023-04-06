//
//  Date+Extensions.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 02.04.2023.
//

import Foundation

extension Date {
    static func utc(_ time: String, dateStyle: Date.FormatStyle.DateStyle, timeStyle: Date.FormatStyle.TimeStyle) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        guard let date = dateFormatter.date(from: time) else { return nil }
        return date.formatted(date: dateStyle, time: timeStyle)
    }
}
