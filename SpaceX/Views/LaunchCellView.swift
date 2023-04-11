//
//  LaunchCellView.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 03.04.2023.
//

import SwiftUI

struct LaunchCellView: View {
    let launchViewModel: LaunchViewModel
    
    var body: some View {
        HStack(alignment: .top) {
            LogoView(launchViewModel: launchViewModel, logoFormat: .big)
            VStack(alignment: .center, spacing: 10) {
                TitleView(launchViewModel: launchViewModel)
                DateView(launchViewModel: launchViewModel, dateStyle: .abbreviated, timeStyle: .omitted)
                StatusView(launchViewModel: launchViewModel, statusFormat: .big, maxWidth: .infinity)
                    .padding(.top, 6)
            }
            Spacer()
        }
    }
}
