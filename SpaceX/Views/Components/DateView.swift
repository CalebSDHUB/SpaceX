//
//  DateView.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 03.04.2023.
//

import SwiftUI

struct DateView: View {
    let launchViewModel: LaunchViewModel
    
    var body: some View {
        Text(launchViewModel.LaunchDate)
            .bold()
            .foregroundColor(.secondary)
            .multilineTextAlignment(.center)
    }
}
