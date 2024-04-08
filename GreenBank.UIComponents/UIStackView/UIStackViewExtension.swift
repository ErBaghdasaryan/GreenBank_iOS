//
//  UIStackViewExtension.swift
//  GreenBank.UIComponents
//
//  Created by Eprem Sargsyan on 24.01.24.
//

import UIKit

public extension UIStackView {
    convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
        self.init(arrangedSubviews: arrangedSubviews)
        
        self.axis = axis
        self.spacing = spacing
        self.distribution = .fillEqually
        self.isUserInteractionEnabled = true
    }
}
