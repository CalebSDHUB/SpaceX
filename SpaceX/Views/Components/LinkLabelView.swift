//
//  LinkLabelView.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 06.04.2023.
//

import SwiftUI

struct LinkLabelView: View {
    let title: String
    let urlString: String
    let icon: AnyView
    let color: Color

    
    var body: some View {
        if let url = URL(string: urlString) {
            HStack {
                icon
                    .foregroundColor(color)
                Link(title, destination: url)
            }
        } else {
            Image(systemName: Constant.Default.systemImage)
        }
    }
}
