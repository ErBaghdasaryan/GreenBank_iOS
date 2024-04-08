//
//  RegistrationView.swift
//  GreenBank.UIComponents
//
//  Created by Er Baghdasaryan on 17.01.24.
//

import UIKit
import GreenBank_UIComponents

final class FirstRegistrationView: UIView {
    
    private var progressView = ProgressView(pageNumber: 1)
    
    var nameTF = SystemTextField(labelText: "register_page_name_label".localized, 
                                 helperLabelText: "",
                                 placeholder: "name_placeholder".localized)
    
    var lastNameTF = SystemTextField(labelText: "register_page_lastName_label".localized,
                                     helperLabelText: "",
                                     placeholder: "lastName_placeholder".localized)
    
    var datePicker = DatePickerView()
    
    public var continueButton = PrimaryButton(title: "button_continue_title".localized, titleColor: UIColor.white)
    
    private let logInLabel = UILabel(text: "login_page_registration_label".localized, textColor: .sysGray,
                                      font: UIFont.SFProSemiBold(size: 12))
    
    public let logInButton = SecondaryButton(title: "register_page_logInButton_title".localized, titleColor: .sysBlack,
                                               titleFont: UIFont.SFProSemiBold(size: 12))
    
    lazy private var logInStackView = UIStackView(arrangedSubviews: [logInLabel, logInButton])
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        setupGradient()
    }
    
    public func setupUI() {

        nameTF.translatesAutoresizingMaskIntoConstraints = false
        lastNameTF.translatesAutoresizingMaskIntoConstraints = false
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        logInStackView.translatesAutoresizingMaskIntoConstraints = false
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        progressView.translatesAutoresizingMaskIntoConstraints = false
        
        self.backgroundColor = .white
    
        self.layer.cornerRadius = 40
        
        datePicker.setupUI()
        self.addSubview(progressView)
        self.addSubview(nameTF)
        self.addSubview(lastNameTF)
        self.addSubview(continueButton)
        self.addSubview(logInStackView)
        self.addSubview(datePicker)
        continueButton.setupGradient()
        
        logInLabel.textAlignment = .right
        logInStackView.spacing = 10
        logInStackView.alignment = .center
        
        NSLayoutConstraint.activate([
            progressView.widthAnchor.constraint(equalToConstant: 114),
            progressView.heightAnchor.constraint(equalToConstant: 8),
            progressView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            progressView.topAnchor.constraint(equalTo: self.topAnchor, constant: 25)
        ])
        
        NSLayoutConstraint.activate([
            nameTF.heightAnchor.constraint(equalToConstant: 85),
            nameTF.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            nameTF.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            nameTF.topAnchor.constraint(equalTo: self.topAnchor, constant: 80),
        ])
        
        NSLayoutConstraint.activate([
            lastNameTF.heightAnchor.constraint(equalToConstant: 80),
            lastNameTF.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            lastNameTF.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            lastNameTF.topAnchor.constraint(equalTo: nameTF.bottomAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            datePicker.heightAnchor.constraint(equalToConstant: 202.79),
            datePicker.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            datePicker.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            datePicker.topAnchor.constraint(equalTo: lastNameTF.bottomAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            continueButton.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 5),
            continueButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            continueButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            continueButton.heightAnchor.constraint(equalToConstant: 44),
        ])
        
        NSLayoutConstraint.activate([
            logInStackView.topAnchor.constraint(equalTo: continueButton.bottomAnchor, constant: 10),
            logInStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logInStackView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -18)
        ])
        
    }
    
    private func setupGradient() {
        continueButton.backgroundGradientLayer.frame = CGRect(x: 0, y: 0,
                                                              width: continueButton.bounds.size.width,
                                                              height: continueButton.bounds.size.height)
    }
}
