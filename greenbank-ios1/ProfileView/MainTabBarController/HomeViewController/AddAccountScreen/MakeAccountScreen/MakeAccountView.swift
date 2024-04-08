//
//  MakeAccountView.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 05.03.24.
//

import UIKit
import GreenBank_UIComponents

final class MakeAccountView: UIView {
    
    let mainView = BackgroundView()
    
    public let navigationBar = NavigationBar(titleText: "label_Account".localized)
    private let introLabel = UILabel(text: "intro_Label".localized, textColor: .lightGray, font: .SFProRegular(size: 14))
    public let accountView = AccountView()
    public let colorSeter = ColorSeter()
    public let continueButton = PrimaryButton(title: "continue_title".localized, titleColor: .white)
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupGradient()
    }
    
    public func setupUI() {
        self.backgroundColor = .white
        
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        introLabel.translatesAutoresizingMaskIntoConstraints = false
        colorSeter.translatesAutoresizingMaskIntoConstraints = false
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        accountView.translatesAutoresizingMaskIntoConstraints = false
    
        navigationBar.setupConstraints()
        accountView.setupUI()
        customizeIntroLabel()
        
        addSubview(navigationBar)
        addSubview(introLabel)
        addSubview(accountView)
        addSubview(colorSeter)
        addSubview(continueButton)
        
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: self.topAnchor, constant: 65),
            navigationBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            navigationBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            navigationBar.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            introLabel.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 61),
            introLabel.leadingAnchor.constraint(equalTo: navigationBar.leadingAnchor, constant: 0),
            introLabel.trailingAnchor.constraint(equalTo: navigationBar.trailingAnchor, constant: 0),
            introLabel.heightAnchor.constraint(equalToConstant: 51)
        ])
        
        NSLayoutConstraint.activate([
            accountView.topAnchor.constraint(equalTo: introLabel.bottomAnchor, constant: 35),
            accountView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 44),
            accountView.leadingAnchor.constraint(equalTo: self.trailingAnchor, constant: -34),
            accountView.heightAnchor.constraint(equalToConstant: 101)
        ])
        
        NSLayoutConstraint.activate([
            colorSeter.topAnchor.constraint(equalTo: introLabel.bottomAnchor, constant: 231),
            colorSeter.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 99),
            colorSeter.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -105.92),
            colorSeter.heightAnchor.constraint(equalToConstant: 173)
        ])
        
        NSLayoutConstraint.activate([
            continueButton.topAnchor.constraint(equalTo: colorSeter.bottomAnchor, constant: 83),
            continueButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            continueButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            continueButton.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
    
    private func customizeIntroLabel() {
        introLabel.numberOfLines = 3
    }
    
    func setupGradient() {
        continueButton.backgroundGradientLayer.frame = CGRect(x: 0, y: 0,
                                                           width: continueButton.bounds.size.width,
                                                           height: continueButton.bounds.size.height)
    }
}
