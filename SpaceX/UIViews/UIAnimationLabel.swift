//
//  UIAnimationLabel.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 09.04.2023.
//

import UIKit

class UIAnimationLabel: UILabel {
    enum MessageStatus {
        case success, failure
        
        var color: UIColor {
            switch self {
            case .success: return .white
            case .failure: return .red
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
