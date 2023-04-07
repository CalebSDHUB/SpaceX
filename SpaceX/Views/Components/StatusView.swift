//
//  StatusView.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 03.04.2023.
//

import SwiftUI

struct StatusView: View {
    enum StatusFormat {
        case small, big
        
        var format: CGFloat {
            switch self {
            case .small: return Constant.View.Status.smallFormat
            case .big: return Constant.View.Status.bigFormat
            }
        }
    }
    
    let launchViewModel: LaunchViewModel
    var status: Status {
        launchViewModel.launchSuccess ? .success : .failure
    }
    
    let statusFormat: StatusFormat
    let maxWidth: CGFloat?
    
    enum Status {
        case failure
        case success
        
        var title: String {
            switch self {
            case .failure: return Constant.View.Status.failure
            case .success: return Constant.View.Status.success
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
            .font(.system(size: statusFormat.format))
            .fontWeight(.heavy)
            .foregroundColor(.white)
            .frame(maxWidth: maxWidth)
            .padding()
            .background(status.color)
            .cornerRadius(10)
    }
}
