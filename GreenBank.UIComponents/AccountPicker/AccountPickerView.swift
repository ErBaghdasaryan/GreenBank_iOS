//
//  AccountPickerView.swift
//  GreenBank.UIComponents
//
//  Created by Er Baghdasaryan on 20.03.24.
//

import UIKit

public class AccountPickerView: UIView {
    
    private var textLabel = UILabel(text: "", textColor: .sysBlack,
                                   font: UIFont.SFProMedium(size: 14))
    
    public var typePicker = AccountPicker(imageName: "",
                                       placeholder: "",
                                       tableViewHeight: 112,
                                       currencyData: [])
    
    public func setupUI(withText text: String, typePicker: AccountPicker) {
        
        self.typePicker = typePicker
        textLabel.text = text
        
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        self.typePicker.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(textLabel)
        self.addSubview(self.typePicker)
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: self.topAnchor),
            textLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
            textLabel.widthAnchor.constraint(equalToConstant: 361),
            textLabel.heightAnchor.constraint(equalToConstant: 17)
        ])
        
        NSLayoutConstraint.activate([
            self.typePicker.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 4),
            self.typePicker.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.typePicker.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.typePicker.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

