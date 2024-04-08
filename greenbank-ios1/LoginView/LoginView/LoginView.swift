//
//  LoginView.swift
//  greenbank-ios1
//
//  Created by Hovo Ohanyan on 19.01.24.
//

import UIKit
import GreenBank_UIComponents

final class LoginView: UIView {
    private let loginLabel = UILabel(text: "login_label".localized, textColor: .sysBlack,
                                     font: UIFont.SFProBold(size: 40))
    
    private let signUpLabel = UILabel(text: "login_page_registration_label".localized, textColor: .sysGray,
                                      font: UIFont.SFProSemiBold(size: 12))
    
    let messageLabel = UILabel(text: "", textColor: .sysFalseTFBorder,
                               font: UIFont.SFProMedium(size: 20))
    
    let emailTextField = SystemTextField(labelText: "email_label".localized,
                                         helperLabelText: "",
                                         placeholder: "email_placeholder".localized,
                                         rightImage: "person")
    
    let passwordTextField = SystemTextField(labelText: "password_label".localized,
                                            helperLabelText: "",
                                            placeholder: "password_placeholder".localized,
                                            isSecureTextEntry: true)
    
    let loginButton = PrimaryButton(title: "button_login_title".localized, titleColor: .white)
    
    let forgotButton = SecondaryButton(title: "login_page_forgotPassword".localized, titleColor: .sysBlack,
                                       titleFont: UIFont.SFProRegular(size: 12))
    
    var activityIndicartor: UIActivityIndicatorView = {
        let active = UIActivityIndicatorView()
        active.color = .sysMainWhite
        return active
    }()
    
    public let signUpButton = SecondaryButton(title: "signup_Label".localized, titleColor: .sysBlack,
                                              titleFont: UIFont.SFProSemiBold(size: 12))
    
    lazy private var textFieldStackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField])
    lazy private var signUpStackView = UIStackView(arrangedSubviews: [signUpLabel, signUpButton])
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupGradient()
    }
    
    func setupUI() {
        self.backgroundColor = .none
        emailTextField.textField.text = "baghdasaryan.er@inbox.ru"
        passwordTextField.textField.text = "erik2001R"
        
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        textFieldStackView.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        forgotButton.translatesAutoresizingMaskIntoConstraints = false
        signUpStackView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicartor.translatesAutoresizingMaskIntoConstraints = false
        
        signUpLabel.textAlignment = .right
        
        textFieldStackView.axis = .vertical
        textFieldStackView.spacing = 22
        textFieldStackView.distribution = .fillEqually
        
        signUpStackView.axis = .horizontal
        signUpStackView.spacing = -1
        signUpStackView.alignment = .leading
        signUpStackView.distribution = .fillProportionally
        
        self.addSubview(loginLabel)
        self.addSubview(textFieldStackView)
        self.addSubview(loginButton)
        self.addSubview(forgotButton)
        self.addSubview(signUpStackView)
        self.addSubview(loginButton)
        loginButton.addSubview(activityIndicartor)
        self.addSubview(messageLabel)
        
        self.autoLayoutConfiguration()
    }
    
    private func autoLayoutConfiguration() {
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 102),
            loginLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            loginLabel.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 40),
            messageLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            messageLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            textFieldStackView.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 105),
            textFieldStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            textFieldStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            textFieldStackView.heightAnchor.constraint(equalToConstant: 190)
        ])
        
        NSLayoutConstraint.activate([
            forgotButton.topAnchor.constraint(equalTo: textFieldStackView.bottomAnchor, constant: 12),
            forgotButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -13),
            forgotButton.widthAnchor.constraint(equalToConstant: 167),
            forgotButton.heightAnchor.constraint(equalToConstant: 14)
        ])
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(lessThanOrEqualTo: textFieldStackView.bottomAnchor, constant: 240),
            loginButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            loginButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        NSLayoutConstraint.activate([
            signUpStackView.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 25),
            signUpStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            signUpStackView.heightAnchor.constraint(equalToConstant: 14)
        ])
        
        NSLayoutConstraint.activate([
            activityIndicartor.centerXAnchor.constraint(equalTo: loginButton.centerXAnchor),
            activityIndicartor.centerYAnchor.constraint(equalTo: loginButton.centerYAnchor),
        ])
    }

    func setupGradient() {
        loginButton.backgroundGradientLayer.frame = CGRect(x: 0, y: 0,
                                          width: loginButton.bounds.size.width,
                                          height: loginButton.bounds.size.height)
    }
}
