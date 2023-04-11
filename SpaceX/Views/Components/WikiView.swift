//
//  WikiView.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 06.04.2023.
//

import SwiftUI

struct WikiView: View {
    let title: String
    
    var body: some View {
        Text(title)
            .fontDesign(.serif)
            .padding(.leading, 4)
    }
}
