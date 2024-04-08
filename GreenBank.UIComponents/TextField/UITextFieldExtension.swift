//
//  UITextFieldExtension.swift
//  GreenBank.UIComponents
//
//  Created by Er Baghdasaryan on 25.01.24.
//  Created by Hovo Ohanyan on 22.01.24.
//

import UIKit

public extension UITextField {
    convenience init(isVerificationTextField: Bool = true) {
        self.init()
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 8 // Adjust the corner radius as needed
        self.layer.masksToBounds = true

        self.textAlignment = .center
        self.placeholder = "-"
        self.font = UIFont(name: "Roboto-Medium", size: 24)
        self.borderStyle = .roundedRect
        self.layer.cornerRadius = 12
        self.keyboardType = .numberPad
        self.layer.borderColor = UIColor(red: 0.16, green: 0.85, blue: 0.81, alpha: 1).cgColor
    }
}
