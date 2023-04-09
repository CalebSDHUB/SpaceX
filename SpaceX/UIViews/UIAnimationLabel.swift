//
//  UIAnimationLabel.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 09.04.2023.
//

import UIKit

class UIAnimationLabel: UILabel {
    enum MessageStatus {
        case normal, warning
        
        var uiColor: UIColor {
            switch self {
            case .normal: return .primary
            case .warning: return .red
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        animationReadyUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func message(_ text: String, status: MessageStatus) {
        self.text = text
        self.textColor = status.uiColor
    }
    
    func animate() {
        UIView.animate(withDuration: 2, animations: {
            self.alpha = 1
        }, completion: { [weak self] finished in
            if finished {
                self?.fadeOut()
            }
        })
    }
    
    private func fadeOut() {
        UIView.animate(withDuration: 2, delay: 2, animations: { [weak self] in
            self?.alpha = 0
        })
    }
    
    func animationReadyUI() {
        self.alpha = 0
    }
}
