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
                
                LinkLabelView(title: "Webcast", urlString: "https://www.youtube.com/watch?v=0a_00nJ_Y88", icon: Image(systemName: "play.rectangle.fill").toAnyView(), color: .red)
                LinkLabelView(title: "Article", urlString: "https://www.space.com/2196-spacex-inaugural-falcon-1-rocket-lost-launch.html", icon: Image(systemName: "newspaper.fill").toAnyView(), color: .primary)
                LinkLabelView(title: "Wikipedia", urlString: "https://en.wikipedia.org/wiki/DemoSat", icon:
                                Text("W")
                    .fontDesign(.serif)
                    .padding(.leading, 4)
                    .toAnyView(), color: .primary)
            }
            
            Section("Failures") {
                
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
