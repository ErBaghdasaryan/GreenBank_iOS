//
//  SecondaryButton.swift
//  GreenBank.UIComponents
//
//  Created by Eprem Sargsyan on 13.01.24.
//

import UIKit

public class SecondaryButton: UIButton {
    public convenience init(title: String,
                            titleColor: UIColor,
                            titleFont: UIFont? = UIFont.SFProBold(size: 14),
                            rightImage: UIImage? = nil,
                            leftImage: UIImage? = nil) {
        self.init(type: .system)
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.layer.cornerRadius = 21
        self.titleLabel?.font = titleFont
        
        if let rightImage {
            let imageView = UIImageView(image: rightImage)
            
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            self.addSubview(imageView)
            
            NSLayoutConstraint.activate([
                imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15)
            ])
        }
        
        if let leftImage {
            let imageView = UIImageView(image: leftImage)
            
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            self.addSubview(imageView)
            
            NSLayoutConstraint.activate([
                imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15)
            ])
        }
        
    }
}

