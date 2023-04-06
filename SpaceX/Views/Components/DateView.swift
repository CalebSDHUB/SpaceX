//
//  DateView.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 03.04.2023.
//

import SwiftUI

struct DateView: View {
    let launchViewModel: LaunchViewModel
    let dateStyle: Date.FormatStyle.DateStyle
    let timeStyle: Date.FormatStyle.TimeStyle
    
    var body: some View {
        Text(Date.utc(launchViewModel.launchDate ?? Constant.Default.string, dateStyle: dateStyle, timeStyle: timeStyle) ?? Constant.Default.string )
            .bold()
            .foregroundColor(.secondary)
            .multilineTextAlignment(.center)
    }
}
