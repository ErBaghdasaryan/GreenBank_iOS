//
//  AddAccountView.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 04.03.24.
//

import UIKit
import GreenBank_UIComponents

class AddAccountView: UIView {
    
    public let mainView = BackgroundView()
    
    public let navigationBar = NavigationBar(titleText: "label_Account".localized)
    
    let firstInstance = AccountView()
    let secondInstance = AccountView()
    let thirdInstance = AccountView()
    let fourthInstance = AccountView()
    
    public var addAccountButton = UIButton(type: .system)
    public let continueButton = PrimaryButton(title: "button_continue_title".localized, titleColor: .white)

    func setupUI() {
        self.backgroundColor = .sysMainWhite
        
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        firstInstance.translatesAutoresizingMaskIntoConstraints = false
        secondInstance.translatesAutoresizingMaskIntoConstraints = false
        thirdInstance.translatesAutoresizingMaskIntoConstraints = false
        fourthInstance.translatesAutoresizingMaskIntoConstraints = false
        addAccountButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        
        navigationBar.setupConstraints()
        firstInstance.setupUI()
        secondInstance.setupUI()
        thirdInstance.setupUI()
        fourthInstance.setupUI()
        continueButton.setupGradient()
        
        addSubview(navigationBar)
        addSubview(firstInstance)
        addSubview(secondInstance)
        addSubview(thirdInstance)
        addSubview(fourthInstance)
        addSubview(addAccountButton)
        addSubview(continueButton)
        
        secondInstance.customizeAccountStyle()
        thirdInstance.customizeAccountStyle()
        fourthInstance.customizeAccountStyle()
        customizePlusButton()
        
        setupConstraints()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupGradient(instance: secondInstance,
                      color1: .sysAccountSecond1,
                      color2: .sysAccountSecond2,
                      color3: .sysAccountSecond3)
        setupGradient(instance: thirdInstance,
                      color1: .sysAccountThird1,
                      color2: .sysAccountThird2,
                      color3: .sysAccountThird1)
        setupGradient(instance: fourthInstance,
                      color1: .sysAccountFourth1,
                      color2: .sysAccountFourth2,
                      color3: .sysAccountFourth1)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: self.topAnchor, constant: 65),
            navigationBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            navigationBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            navigationBar.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            firstInstance.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 66),
            firstInstance.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 34),
            firstInstance.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            firstInstance.heightAnchor.constraint(equalToConstant: 101)
        ])
        
        NSLayoutConstraint.activate([
            secondInstance.topAnchor.constraint(equalTo: firstInstance.bottomAnchor, constant: 9),
            secondInstance.leadingAnchor.constraint(equalTo: firstInstance.leadingAnchor),
            secondInstance.trailingAnchor.constraint(equalTo: firstInstance.trailingAnchor),
            secondInstance.heightAnchor.constraint(equalToConstant: 101)
        ])
        
        NSLayoutConstraint.activate([
            thirdInstance.topAnchor.constraint(equalTo: secondInstance.bottomAnchor, constant: 9),
            thirdInstance.leadingAnchor.constraint(equalTo: firstInstance.leadingAnchor),
            thirdInstance.trailingAnchor.constraint(equalTo: firstInstance.trailingAnchor),
            thirdInstance.heightAnchor.constraint(equalToConstant: 101)
        ])
        
        NSLayoutConstraint.activate([
            fourthInstance.topAnchor.constraint(equalTo: thirdInstance.bottomAnchor, constant: 9),
            fourthInstance.leadingAnchor.constraint(equalTo: firstInstance.leadingAnchor),
            fourthInstance.trailingAnchor.constraint(equalTo: firstInstance.trailingAnchor),
            fourthInstance.heightAnchor.constraint(equalToConstant: 101)
        ])
        
        NSLayoutConstraint.activate([
            addAccountButton.topAnchor.constraint(equalTo: fourthInstance.bottomAnchor, constant: 17),
            addAccountButton.centerXAnchor.constraint(equalTo: fourthInstance.centerXAnchor),
            addAccountButton.widthAnchor.constraint(equalToConstant: 46),
            addAccountButton.heightAnchor.constraint(equalToConstant: 46)
        ])
        
        NSLayoutConstraint.activate([
            continueButton.topAnchor.constraint(equalTo: addAccountButton.bottomAnchor, constant: 41),
            continueButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            continueButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            continueButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func customizePlusButton() {
        self.addAccountButton.tintColor = .black
        self.addAccountButton.setImage(UIImage(named: "green_Plus_Button".localized)?.withRenderingMode(.alwaysTemplate), for: .normal)
        self.addAccountButton.layer.borderWidth = 2
        self.addAccountButton.layer.borderColor = UIColor.sysGlobalGreen.cgColor
        self.addAccountButton.layer.cornerRadius = 24
        self.addAccountButton.layer.masksToBounds = true
    }
    
    func setupGradient(instance: AccountView,
                       color1: UIColor,
                       color2: UIColor,
                       color3: UIColor) {

        instance.setupGradientBackground(color1: color1,
                                         color2: color2,
                                         color3: color3)
        
        instance.backgroundGradientLayer.frame = CGRect(x: 0, y: 0,
                                                           width: instance.bounds.size.width,
                                                           height: instance.bounds.size.height)
        
        continueButton.backgroundGradientLayer.frame = CGRect(x: 0, y: 0,
                                                           width: continueButton.bounds.size.width,
                                                           height: continueButton.bounds.size.height)
    }
}
