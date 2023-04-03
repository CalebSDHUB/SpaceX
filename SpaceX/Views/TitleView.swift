//
//  TitleView.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 03.04.2023.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        Text("FalconSat")
            .font(.title)
            .bold()
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
