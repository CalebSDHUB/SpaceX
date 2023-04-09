//
//  UIAnimationLabel.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 09.04.2023.
//

import UIKit

class UIAnimationLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func message(_ text: String, messageStatus: MessageStatus) {
        self.text = text
        self.textColor = messageStatus.uiColor
    }
    
    func animate() {
        UIView.animate(withDuration: 0.5, animations: {
            self.alpha = 1
        }, completion: { [weak self] finished in
            if finished {
                self?.fadeOut()
            }
        })
    }
    
    private func fadeOut() {
        UIView.animate(withDuration: 1.5, delay: 1, animations: { [weak self] in
            self?.alpha = 0
        })
    }
    
    private func setupUI() {
        self.alpha = 0
        self.adjustsFontSizeToFitWidth = true
    }
}
