//
//  ContentView.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 06.04.2023.
//

import SwiftUI

struct ContentView: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.callout)
            .fontDesign(.serif)
        .fontWeight(.regular)
        .italic()
    }
}
