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
    
    func message(_ text: String, status: MessageStatus) {
        self.text = text
        self.textColor = status.uiColor
    }
    
    func animate() {
        UIView.animate(withDuration: 1, animations: {
            self.alpha = 1
        }, completion: { [weak self] finished in
            if finished {
                self?.fadeOut()
            }
        })
    }
    
    private func fadeOut() {
        UIView.animate(withDuration: 1, delay: 1, animations: { [weak self] in
            self?.alpha = 0
        })
    }
    
    func setupUI() {
        self.alpha = 0
        self.adjustsFontSizeToFitWidth = true
    }
}
