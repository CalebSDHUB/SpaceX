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

struct DateView: View {
    var body: some View {
        Text(Date().formatted().description)
            .bold()
            .foregroundColor(.secondary)
    }
}

struct StatusView: View {
    let status: Status
    
    enum Status {
        case failure
        case success
        
        var title: String {
            switch self {
            case .failure: return "Failure"
            case .success: return "Success"
            }
        }
        
        var color: Color {
            switch self {
            case .failure: return .red
            case .success: return .green
            }
        }
    }
    var body: some View {
        Text(status.title)
            .font(.title3)
            .fontWeight(.heavy)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical)
            .background(status.color)
            .cornerRadius(10)
            
            .buttonStyle(.borderedProminent)
    }
}
