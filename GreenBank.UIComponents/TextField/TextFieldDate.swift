//
//  CustomTextField.swift
//  DatePicker
//
//  Created by Eprem Sargsyan on 17.01.24.
//

import UIKit

public class TextFieldDate: UITextField {

    public convenience init(placeholder: String, image: UIImage) {
        self.init()
    
        let imageView = UIImageView(image: image)
        self.rightView = imageView
        self.rightViewMode = .always
        
        self.placeholder = placeholder
        self.layer.cornerRadius = 7
        self.isUserInteractionEnabled = false
        self.layer.borderWidth = 1
        self.textAlignment = .center
        self.layer.borderColor = UIColor.systemGray.cgColor
        self.textColor = UIColor.systemGray
        
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        
        self.font = UIFont.systemFont(ofSize: 12)
    }

    public override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.rightViewRect(forBounds: bounds)
        rect.origin.x -= 7
        return rect
    }
}
