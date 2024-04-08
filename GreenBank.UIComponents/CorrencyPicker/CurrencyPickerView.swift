//
//  CurrencyPickerView.swift
//  GreenBank.UIComponents
//
//  Created by Hovo Ohanyan on 08.02.24.
//

import UIKit

public class CurrencyPickerView: UIView {
    private var textLabel = UILabel(text: "", textColor: .sysBlack, 
                                   font: UIFont.SFProMedium(size: 14))
    
    public var currencyPicker = CurrencyPicker(imageName: "", placeholder: "",
                                               currencyData: [])
    
    public func setupUI(withText text: String, currencyPicker: CurrencyPicker) {
        self.currencyPicker = currencyPicker
        textLabel.text = text
        
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        self.currencyPicker.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(textLabel)
        self.addSubview(self.currencyPicker)
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: self.topAnchor),
            textLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
            textLabel.widthAnchor.constraint(equalToConstant: 361),
            textLabel.heightAnchor.constraint(equalToConstant: 17)
        ])
        
        NSLayoutConstraint.activate([
            self.currencyPicker.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 4),
            self.currencyPicker.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.currencyPicker.widthAnchor.constraint(equalToConstant: 361),
            self.currencyPicker.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
