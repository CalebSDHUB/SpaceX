//
//  DateView.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 03.04.2023.
//

import SwiftUI

struct DateView: View {
    var body: some View {
        Text(Date().formatted().description)
            .bold()
            .foregroundColor(.secondary)
    }
}

struct DateView_Previews: PreviewProvider {
    static var previews: some View {
        DateView()
    }
}
