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
    let image: AnyView

    
    var body: some View {
        HStack {
            image
                .foregroundColor(.red)
            Link(title, destination: URL(string: urlString)!)
        }
    }
}
