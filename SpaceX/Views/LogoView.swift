//
//  LogoImage.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 03.04.2023.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        AsyncImage(url: URL(string: "https://images2.imgbox.com/f9/4a/ZboXReNb_o.png")) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
        } placeholder: {
            ProgressView()
        }
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
