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
    
    @State private var count = 0
    @State private var loading = true
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    let launchViewModel: LaunchViewModel
    let logoFormat: LogoFormat
    
    var body: some View {
        AsyncImage(url: URL(string: launchViewModel.imageLogo)) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(width: logoFormat.format, height: logoFormat.format)
        } placeholder: {
            if loading {
                ProgressView()
                    .foregroundColor(.secondary)
                    .frame(width: logoFormat.format, height: logoFormat.format)
                    .onReceive(timer) { _ in
                        if count == 1 {
                            loading = false
                            count = 0
                            timer.upstream.connect().cancel()
                        }
                        count += 1
                    }
            } else {
                Image(systemName: Constant.Default.systemImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: logoFormat.format, height: logoFormat.format)
                    .opacity(0)
            }
        }
    }
}
