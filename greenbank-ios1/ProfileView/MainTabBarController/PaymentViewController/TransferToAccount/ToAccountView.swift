//
//  ToAccountView.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 12.03.24.
//

import UIKit
import GreenBank_UIComponents

final class ToAccountView: UIView {
    
    public let navigationBar = NavigationBar(titleText: "transferToAccount_label".localized)
    public let chooseAccountTypeTF = AccountPickerView()
    public let amountTextField = SystemTextField(labelText: "amount_label".localized,
                                                 helperLabelText: "",
                                                 placeholder: "amount_placeholder".localized)
    public let creditAccountTextField = SystemTextField(labelText: "creditAccount_label".localized,
                                                     helperLabelText: "",
                                                     placeholder: "creditAccount_placeholder".localized)
    public let messageTextField = SystemTextField(labelText: "message_label".localized,
                                                  helperLabelText: "",
                                                  placeholder: "message_placeholder".localized)
    public let continueButton = PrimaryButton(title: "continue_title".localized,
                                              titleColor: .white)
    var activityIndicartor: UIActivityIndicatorView = {
        let active = UIActivityIndicatorView()
        active.color = .sysMainWhite
        return active
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupGradient()
    }
    
    public func setupUI(withData: AccountEditModel) {
        
        backgroundColor = .white
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        chooseAccountTypeTF.translatesAutoresizingMaskIntoConstraints = false
        amountTextField.translatesAutoresizingMaskIntoConstraints = false
        creditAccountTextField.translatesAutoresizingMaskIntoConstraints = false
        messageTextField.translatesAutoresizingMaskIntoConstraints = false
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        activityIndicartor.translatesAutoresizingMaskIntoConstraints = false
        
        navigationBar.setupConstraints()
        navigationBar.greenView.isHidden = true
        
        addSubview(navigationBar)
        addSubview(chooseAccountTypeTF)
        addSubview(amountTextField)
        addSubview(creditAccountTextField)
        addSubview(messageTextField)
        addSubview(continueButton)
        addSubview(activityIndicartor)
        
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: self.topAnchor, constant: 65),
            navigationBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            navigationBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            navigationBar.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            chooseAccountTypeTF.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 48),
            chooseAccountTypeTF.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            chooseAccountTypeTF.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            chooseAccountTypeTF.heightAnchor.constraint(equalToConstant: 85),
        ])
        
        NSLayoutConstraint.activate([
            amountTextField.topAnchor.constraint(equalTo: chooseAccountTypeTF.bottomAnchor, constant: 4),
            amountTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            amountTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            amountTextField.heightAnchor.constraint(equalToConstant: 85),
        ])
        
        NSLayoutConstraint.activate([
            creditAccountTextField.topAnchor.constraint(equalTo: amountTextField.bottomAnchor, constant: 4),
            creditAccountTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            creditAccountTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            creditAccountTextField.heightAnchor.constraint(equalToConstant: 85),
        ])
        
        NSLayoutConstraint.activate([
            messageTextField.topAnchor.constraint(equalTo: creditAccountTextField.bottomAnchor, constant: 4),
            messageTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            messageTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            messageTextField.heightAnchor.constraint(equalToConstant: 85),
        ])
        
        NSLayoutConstraint.activate([
            continueButton.topAnchor.constraint(equalTo: messageTextField.bottomAnchor, constant: 186),
            continueButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            continueButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            continueButton.heightAnchor.constraint(equalToConstant: 44),
        ])
        
        NSLayoutConstraint.activate([
            activityIndicartor.centerXAnchor.constraint(equalTo: self.continueButton.centerXAnchor),
            activityIndicartor.centerYAnchor.constraint(equalTo: self.continueButton.centerYAnchor)
        ])
    }
    
    func setupGradient() {
        continueButton.backgroundGradientLayer.frame = CGRect(x: 0, y: 0,
                                                           width: continueButton.bounds.size.width,
                                                           height: continueButton.bounds.size.height)
    }
}
