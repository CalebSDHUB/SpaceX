//
//  StatusView.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 03.04.2023.
//

import SwiftUI

struct StatusView: View {
    let launchViewModel: LaunchViewModel
    
    var status: Status {
        launchViewModel.launchSuccess ? .success : .failure
    }
    
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
    }
}