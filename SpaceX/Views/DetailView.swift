//
//  DetailView.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 04.04.2023.
//

import SwiftUI

struct DetailView: View {
    let launchViewModel: LaunchViewModel
    
    var body: some View {
        List {
            Section(Constant.View.Detail.sectionMission) {
                HStack {
                    TitleView(launchViewModel: launchViewModel)
                    LogoView(launchViewModel: launchViewModel, logoFormat: .small)
                }

                
                LinkLabelView(title: "Webcast", urlString: "https://www.youtube.com/watch?v=0a_00nJ_Y88", icon: Image(systemName: Constant.View.Detail.iconPlay).toAnyView(), color: .red)
                LinkLabelView(title: "Article", urlString: "https://www.space.com/2196-spacex-inaugural-falcon-1-rocket-lost-launch.html", icon: Image(systemName: Constant.View.Detail.iconNewspaper).toAnyView(), color: .primary)
                LinkLabelView(title: "Wikipedia", urlString: "https://en.wikipedia.org/wiki/DemoSat", icon:
                WikiView(title: Constant.View.Detail.iconWikipedia)
                    .toAnyView(), color: .primary)
            }
            
            if true {
                Section(Constant.View.Detail.sectionFailureReason) {
                    Text("sdfijdfjdklfsdj")
                }
                
                Section(Constant.View.Detail.sectionFailureDetails) {
                    Text("sdfijdfjdklfsdj")
                }
            }
            
            
        }
        .font(.headline)
        .accentColor(.blue)
        .listStyle(.grouped)
    }
}
