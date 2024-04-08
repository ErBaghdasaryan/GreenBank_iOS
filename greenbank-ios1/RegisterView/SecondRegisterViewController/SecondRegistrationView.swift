//
//  SecondRegistrationView.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 24.01.24.
//

import UIKit
import GreenBank_UIComponents

final class SecondRegistrationView: UIView {
    
    private let progressView = ProgressView(pageNumber: 2)
    
    var emailTF = SystemTextField(labelText: "register_page_email_label".localized,
                                  helperLabelText: "",
                                  placeholder: "register_page_email_placeholder".localized)
    
    var phoneNumberTF = SystemTextField(labelText: "register_page_phoneNumber_label".localized,
                                        helperLabelText: "",
                                        placeholder: "register_page_phoneNumber_placeholder".localized)
    
    var passwordTF = SystemTextField(labelText: "register_page_password_label".localized,
                                     helperLabelText: "",
                                     placeholder: "register_page_password_placeholder".localized,
                                     isSecureTextEntry: true)
    
    var repeatPasswordTF = SystemTextField(labelText: "register_page_repeatPassword_label".localized,
                                           helperLabelText: "",
                                           placeholder: "register_page_password_placeholder".localized,
                                           isSecureTextEntry: true)
    
    public var continueButton = PrimaryButton(title: "button_continue_title".localized, titleColor: UIColor.white)
    
    private let logInLabel = UILabel(text: "login_page_registration_label".localized, textColor: .sysGray,
                                     font: UIFont.SFProSemiBold(size: 12))
    
    public let logInButton = SecondaryButton(title: "register_page_logInButton_title".localized, titleColor: .sysBlack,
                                             titleFont: UIFont.SFProSemiBold(size: 12))
    
    var activityIndicartor: UIActivityIndicatorView = {
        let active = UIActivityIndicatorView()
        active.color = .sysMainWhite
        return active
    }()
    
    lazy private var logInStackView = UIStackView(arrangedSubviews: [logInLabel, logInButton])
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        setupGradient()
    }
    
    public func setupUI() {
        
        progressView.translatesAutoresizingMaskIntoConstraints = false
        emailTF.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberTF.translatesAutoresizingMaskIntoConstraints = false
        passwordTF.translatesAutoresizingMaskIntoConstraints = false
        repeatPasswordTF.translatesAutoresizingMaskIntoConstraints = false
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        logInStackView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicartor.translatesAutoresizingMaskIntoConstraints = false

        self.backgroundColor = .white
        self.layer.cornerRadius = 40
        
        self.addSubview(progressView)
        self.addSubview(emailTF)
        self.addSubview(phoneNumberTF)
        self.addSubview(passwordTF)
        self.addSubview(repeatPasswordTF)
        self.addSubview(continueButton)
        self.addSubview(logInStackView)
        continueButton.addSubview(activityIndicartor)
        
        continueButton.setupGradient()
        
        logInLabel.textAlignment = .right
        
        logInStackView.axis = .horizontal
        logInStackView.spacing = -1
        logInStackView.distribution = .fillProportionally
        
        NSLayoutConstraint.activate([
            progressView.widthAnchor.constraint(equalToConstant: 114),
            progressView.heightAnchor.constraint(equalToConstant: 8),
            progressView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            progressView.topAnchor.constraint(equalTo: self.topAnchor, constant: 25)
        ])
        
        NSLayoutConstraint.activate([
            emailTF.widthAnchor.constraint(equalToConstant: 362),
            emailTF.heightAnchor.constraint(equalToConstant: 83),
            emailTF.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
            emailTF.topAnchor.constraint(equalTo: self.topAnchor, constant: 98),
        ])
        
        NSLayoutConstraint.activate([
            phoneNumberTF.widthAnchor.constraint(equalToConstant: 362),
            phoneNumberTF.heightAnchor.constraint(equalToConstant: 83),
            phoneNumberTF.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0.5),
            phoneNumberTF.topAnchor.constraint(equalTo: emailTF.bottomAnchor, constant: 15)
        ])
        
        NSLayoutConstraint.activate([
            passwordTF.widthAnchor.constraint(equalToConstant: 362),
            passwordTF.heightAnchor.constraint(equalToConstant: 83),
            passwordTF.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0.5),
            passwordTF.topAnchor.constraint(equalTo: phoneNumberTF.bottomAnchor, constant: 15)
        ])
        
        NSLayoutConstraint.activate([
            repeatPasswordTF.widthAnchor.constraint(equalToConstant: 362),
            repeatPasswordTF.heightAnchor.constraint(equalToConstant: 83),
            repeatPasswordTF.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0.5),
            repeatPasswordTF.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 15)
        ])
        
        NSLayoutConstraint.activate([
            continueButton.widthAnchor.constraint(equalToConstant: 361),
            continueButton.heightAnchor.constraint(equalToConstant: 44),
            continueButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
            continueButton.topAnchor.constraint(equalTo: repeatPasswordTF.bottomAnchor, constant: 65),
        ])
        
        NSLayoutConstraint.activate([
            logInStackView.topAnchor.constraint(equalTo: continueButton.bottomAnchor, constant: 28),
            logInStackView.widthAnchor.constraint(equalToConstant: 190),
            logInStackView.heightAnchor.constraint(equalToConstant: 14),
            logInStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0.5)
        ])
        
        NSLayoutConstraint.activate([
            activityIndicartor.centerXAnchor.constraint(equalTo: continueButton.centerXAnchor),
            activityIndicartor.centerYAnchor.constraint(equalTo: continueButton.centerYAnchor),
        ])
    }
    
    private func setupGradient() {
        continueButton.backgroundGradientLayer.frame = CGRect(x: 0, y: 0,
                                                              width: continueButton.bounds.size.width,
                                                              height: continueButton.bounds.size.height)
    }
}
