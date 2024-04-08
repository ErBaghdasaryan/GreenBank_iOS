//
//  Label.swift
//  GreenBank.UIComponents
//
//  Created by Eprem Sargsyan on 13.01.24.
//

import UIKit

extension UILabel {
    public convenience init(text: String, textColor: UIColor, font: UIFont?) {
        self.init()
        
        self.text = text
        self.textColor = textColor
        self.font = font
    }
}
