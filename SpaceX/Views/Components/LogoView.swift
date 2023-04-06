//
//  LogoImage.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 03.04.2023.
//

import SwiftUI

struct LogoView: View {
    enum LogoFormat {
        case small, big
        
        var format: CGFloat {
            switch self {
            case .small: return Constant.View.Logo.smallFormat
            case .big: return Constant.View.Logo.bigFormat
            }
        }
    }
    
    let launchViewModel: LaunchViewModel
    let logoFormat: LogoFormat
    
    var body: some View {
        AsyncImage(url: URL(string: launchViewModel.imageLogo)) { image in
            image
                .resizable()
                            .scaledToFit()
                            .frame(width: logoFormat.format, height: logoFormat.format)
        } placeholder: {
            Image(systemName: Constant.Default.systemImage)
                .resizable()
                            .scaledToFit()
                            .frame(width: logoFormat.format, height: logoFormat.format)
        }
    }
}

//private extension Image {
//    func imageModifier() -> some View {
//        self
//            .resizable()
//            .scaledToFit()
//            .frame(width: LogoSize., height: 25)
//    }
//}
