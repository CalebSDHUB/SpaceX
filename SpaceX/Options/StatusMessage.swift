//
//  StatusMessage.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 09.04.2023.
//

import UIKit

enum MessageStatus {
    case normal, warning
    
    var uiColor: UIColor {
        switch self {
        case .normal: return .primary
        case .warning: return .red
        }
    }
}
