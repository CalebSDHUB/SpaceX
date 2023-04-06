//
//  String+Extensions.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 06.04.2023.
//

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
