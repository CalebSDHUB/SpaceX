//
//  LogoImage.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 03.04.2023.
//

import SwiftUI

struct LogoView: View {
    let launchViewModel: LaunchViewModel
    
    var body: some View {
        AsyncImage(url: URL(string: launchViewModel.imageLogo)) { image in
            image
                .imageModifier()
        } placeholder: {
            Image(systemName: Constant.Default.systemImage)
                .imageModifier()
        }
    }
}

private extension Image {
    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 150, height: 150)
    }
}
