//
//  LaunchCellView.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 03.04.2023.
//

import SwiftUI

struct LaunchCellView: View {
//    let launchViewModel: LaunchViewModel
    
    var body: some View {
            HStack(alignment: .top) {
                LogoView()
                VStack(alignment: .center, spacing: 10) {
                    TitleView()
                    DateView()
                    StatusView(status: .success)
                        .padding(.top, 6)
                }
                Spacer()
            }
    }
}

struct LaunchCellView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchCellView()
    }
}
