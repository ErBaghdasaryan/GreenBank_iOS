//
//  TextFieldWLabels.swift
//  GreenBank.UIComponents
//
//  Created by Eprem Sargsyan on 13.01.24.
//

import UIKit

public class SystemTextField: UIView {
    
    let mainLabel: UILabel
    public var helperLabel: UILabel?
    public var textField: TextField

    
    public init(labelText: String, placeholder: String,
                rightImage: String? = nil,
                isSecureTextEntry: Bool = false) {
        
        self.mainLabel = UILabel(text: labelText, textColor: .sysBlack, font: UIFont.SFProMedium(size: 14))
        self.textField = TextField(placeholder: placeholder, rightImage: rightImage, isSecureTextEntry: isSecureTextEntry)
        
        super.init(frame: .zero)
        
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(mainLabel)
        self.addSubview(textField)
        
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: self.topAnchor),
            mainLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainLabel.heightAnchor.constraint(equalToConstant: 17)
        ])
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 4),
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            textField.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    public convenience init(labelText: String, helperLabelText: String, placeholder: String,
                            rightImage: String? = nil,
                            isSecureTextEntry: Bool = false) {
        self.init(labelText: labelText, placeholder: placeholder,
                  rightImage: rightImage,
                  isSecureTextEntry: isSecureTextEntry)
        
        
        self.helperLabel = UILabel(text: helperLabelText, textColor: .sysBlack, font: UIFont.SFProRegular(size: 12))
        helperLabel?.translatesAutoresizingMaskIntoConstraints = false
        
        helperLabel?.font = UIFont.systemFont(ofSize: 12)
        
        self.addSubview(helperLabel!)
        
        NSLayoutConstraint.activate([
            helperLabel!.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 6),
            helperLabel!.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            helperLabel!.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
