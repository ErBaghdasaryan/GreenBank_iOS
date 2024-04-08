//
//  TextField.swift
//  GreenBank.UIComponents
//
//  Created by Eprem Sargsyan on 13.01.24.
//

import UIKit

public class TextField: UITextField {
    var eyeConfiguration: Bool = false
    
    public convenience init(placeholder: String,
                            rightImage: String? = nil,
                            isSecureTextEntry: Bool = false) {
        self.init()
        
        self.placeholder = placeholder
        self.isSecureTextEntry = isSecureTextEntry
        self.layer.cornerRadius = 21
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.sysGray.cgColor
        
        self.textColor = UIColor.gray
        self.font = UIFont.SFProMedium(size: 14)
        self.rightViewMode = .always
        
        if let rightImage {
            let imageView = UIImageView(image: UIImage(named: rightImage)?.withRenderingMode(.alwaysTemplate))
            imageView.tintColor = .sysGray
            self.rightView = imageView
        }
        
        if isSecureTextEntry {
            self.isSecureTextEntry = true
            
            let eyeButton: UIButton = {
                let button = UIButton()
                button.addTarget(self, action: #selector(eyeButtonTapped), for: .touchUpInside)
                return button
            }()
            
            eyeButtonSettings(button: eyeButton)
        }
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
    }
    
    private func eyeButtonSettings(button: UIButton) {
        if self.isSecureTextEntry {
            button.setImage(UIImage(named: "view-off")?.withRenderingMode(.alwaysTemplate), for: .normal)
            
            button.tintColor = .lightGray
            rightView = button
            rightViewMode = .always
        } else {
            button.setImage(UIImage(named: "view")?.withRenderingMode(.alwaysTemplate), for: .normal)
            self.isSecureTextEntry = false
            button.tintColor = .lightGray
            rightView = button
            rightViewMode = .always
        }
    }

    @objc func eyeButtonTapped(button: UIButton) {
        eyeConfiguration = !eyeConfiguration
        self.isSecureTextEntry = !self.isSecureTextEntry
        eyeButtonSettings(button: button)
    }
    
    override public func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 14, dy: 0)
    }
    
    override public func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 14, dy: 0)
    }
    
    override public func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 14, dy: 0)
    }
    
    override public func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.rightViewRect(forBounds: bounds)
        
        if rect.origin.x.isNaN || rect.origin.x.isInfinite {
            rect.origin.x = bounds.width - rect.width
        } else {
            rect.origin.x -= 14
        }
        
        return rect
    }
}
