//
//  UIViewExtension.swift
//  GreenBank.UIComponents
//
//  Created by Er Baghdasaryan on 07.02.24.
//

import UIKit

public extension UIView {
    func shadow(color: UIColor = UIColor.sysShadowColor) {
        self.layer.shadowColor = color.cgColor;
        self.layer.shadowOpacity = 0.6
        self.layer.shadowRadius = 6
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
    }
    
    func removeAllSubviews() {
        self.subviews.forEach { $0.removeFromSuperview() }
    }
}
