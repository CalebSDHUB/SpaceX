//
//  TitleView.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 03.04.2023.
//

import SwiftUI

struct TitleView: View {
    let launchViewModel: LaunchViewModel
    
    var body: some View {
        Text(launchViewModel.title)
            .font(.title)
            .multilineTextAlignment(.center)
            .lineLimit(1)
            .minimumScaleFactor(0.8)
            .bold()
    }
}
