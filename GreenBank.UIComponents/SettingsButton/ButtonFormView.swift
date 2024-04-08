//
//  ButtonFormView.swift
//  GreenBank.UIComponents
//
//  Created by Er Baghdasaryan on 30.03.24.
//

import Foundation
import UIKit

public class ButtonFormView: UIView {
    
    public var settingsTypeLabel = UILabel(text: "",
                                   textColor: .sysBlack,
                                           font: .SFProRegular(size: 15))
    public let typeImage = UIImageView(image: UIImage(named: "master_logo".localized))
    public let button = UIButton(type: .system)
    public let toggleSwitch = UISwitch()
    
    public init(imageName: String, settingType: String, isToggle: Bool = false) {
        super.init(frame: .zero)
        self.setupViews()
        self.typeImage.image = UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate)
        self.typeImage.tintColor = .black
        if isToggle {
            setupToggle()
        }
        self.settingsTypeLabel.text = settingType
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupViews(isToggle: Bool = false) {
        
        settingsTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeImage.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.backgroundColor = .clear
        
        self.addSubview(settingsTypeLabel)
        self.addSubview(typeImage)
        self.addSubview(button)
    
        NSLayoutConstraint.activate([
            typeImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            typeImage.widthAnchor.constraint(equalToConstant: 27),
            typeImage.heightAnchor.constraint(equalToConstant: 27),
            typeImage.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            settingsTypeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            settingsTypeLabel.widthAnchor.constraint(equalToConstant: 210),
            settingsTypeLabel.heightAnchor.constraint(equalToConstant: 21),
            settingsTypeLabel.leadingAnchor.constraint(equalTo: typeImage.trailingAnchor, constant: 14.32)
        ])
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: self.topAnchor),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func setupToggle() {
        toggleSwitch.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(toggleSwitch)
        
        NSLayoutConstraint.activate([
            toggleSwitch.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            toggleSwitch.topAnchor.constraint(equalTo: self.topAnchor),
            toggleSwitch.widthAnchor.constraint(equalToConstant: 30),
            toggleSwitch.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
