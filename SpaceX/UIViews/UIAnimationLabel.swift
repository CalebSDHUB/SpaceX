//
//  UIAnimationLabel.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 09.04.2023.
//

import UIKit

class AnimationLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        animationReadyUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func animate() {
        UIView.animate(withDuration: 2, animations: {
            self.alpha = 1 // Set label to fully visible
        }, completion: { [weak self] finished in
            if finished {
                self?.fadeOut()
            }
        })
    }
    
    private func fadeOut() {
        UIView.animate(withDuration: 2, delay: 2, animations: {
            self.alpha = 0
        })
    }
    
    func animationReadyUI() {
        self.alpha = 0
    }
}
