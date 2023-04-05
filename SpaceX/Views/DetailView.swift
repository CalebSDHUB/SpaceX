//
//  DetailView.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 04.04.2023.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        List {
            Section("Mission") {
                Text("FalconSat")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
                    .bold()
                
                Text("This is a long description. sfjsdfkl;asdjf;klsdjfklasdfjlkasdjf;lsdjfalksdjfkl;sdjfl;kasjdf;klsdjfkl;sdjfkl;sdjfakl;sdjf;klsdjfksdlf")
                
                LinkLabelView(title: "Youtube", urlString: "https://www.youtube.com/watch?v=zwz49S5G4sg&ab_channel=LexClips", image: AnyView(Image(systemName: "play.rectangle.fill")))
            }
        }
        .font(.headline)
        .accentColor(.blue)
        .listStyle(GroupedListStyle())
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
