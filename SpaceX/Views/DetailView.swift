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
                
                HStack {
                    DateView(launchViewModel: launchViewModel, dateStyle: .abbreviated, timeStyle: .shortened)
                    Spacer()
                    StatusView(launchViewModel: launchViewModel, statusFormat: .small, maxWidth: nil)
                }
                
                LinkLabelView(title: Constant.View.Detail.linkWebcast, urlString: launchViewModel.videoURL, icon: Image(systemName: Constant.View.Detail.iconPlay).toAnyView(), color: .red)
                LinkLabelView(title: Constant.View.Detail.linkArticle, urlString: launchViewModel.articleURL, icon: Image(systemName: Constant.View.Detail.iconNewspaper).toAnyView(), color: .primary)
                LinkLabelView(title: Constant.View.Detail.linkWikipedia, urlString: launchViewModel.wikipediaURL, icon:
                WikiView(title: Constant.View.Detail.iconWikipedia)
                    .toAnyView(), color: .primary)
            }
            
            if !launchViewModel.launchSuccess {
                Section(Constant.View.Detail.sectionFailureReason) {
                    ForEach(launchViewModel.failureReasons, id: \.self) { failureReason in
                        ContentView(title: failureReason.capitalizingFirstLetter())
                    }
                    
                }
                Section(Constant.View.Detail.sectionFailureDetails) {
                    ContentView(title: launchViewModel.failureDetail.capitalizingFirstLetter())
                }
            }
            
            
        }
        .font(.headline)
        .accentColor(.blue)
        .listStyle(.grouped)
    }
}
