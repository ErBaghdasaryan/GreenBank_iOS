//
//  ResetPasswordView.swift
//  greenbank-ios1
//
//  Created by Hovo Ohanyan on 22.01.24.
//

import UIKit
import GreenBank_UIComponents

final class ResetPasswordView: UIView {
    
    private let progressView = ProgressView(pageNumber: 3)
    
    private let pageTitileLabel = UILabel(text: "reset_password_page_title".localized,
                                          textColor: .sysBlack, font: UIFont.SFProSemiBold(size: 29))
    
    private let pageHelperTitleLabel = UILabel(text: "reset_password_page_helper_title".localized,
                                               textColor: .sysGray, font: UIFont.SFProRegular(size: 12))
    
    private let loginLabel = UILabel(text: "login_helper_label".localized, textColor: .sysGray,
                                     font: UIFont.SFProSemiBold(size: 12))
    
    
    let passwordTextField = SystemTextField(labelText: "password_label".localized,
                                            placeholder: "password_placeholder".localized, isSecureTextEntry: true)
    
    let changePasswordButton = PrimaryButton(title: "change_password_button_title".localized, titleColor: .white)
    
    let loginButton = SecondaryButton(title: "login_label".localized, titleColor: .sysBlack,
                                      titleFont: UIFont.SFProSemiBold(size: 12))
    
    lazy private var labelStackView = UIStackView(arrangedSubviews: [pageTitileLabel, pageHelperTitleLabel])
    lazy private var loginStackView = UIStackView(arrangedSubviews: [loginLabel, loginButton])
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupGradient()
    }
    
    func setupUI() {
        self.backgroundColor = .white
        
        progressView.translatesAutoresizingMaskIntoConstraints = false
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        loginStackView.translatesAutoresizingMaskIntoConstraints = false
        changePasswordButton.translatesAutoresizingMaskIntoConstraints = false
        
        labelStackView.axis = .vertical
        labelStackView.spacing = 10
        labelStackView.distribution = .fillProportionally
        
        pageTitileLabel.textAlignment = .center
        pageTitileLabel.numberOfLines = 0
        
        pageHelperTitleLabel.textAlignment = .center
        
        loginStackView.axis = .horizontal
        loginStackView.spacing = 0
        loginStackView.distribution = .fillProportionally
        
        self.addSubview(progressView)
        self.addSubview(passwordTextField)
        self.addSubview(labelStackView)
        self.addSubview(changePasswordButton)
        self.addSubview(loginStackView)
        
        makeAutoLayout()
    }
    
    private func makeAutoLayout() {
        NSLayoutConstraint.activate([
            progressView.widthAnchor.constraint(equalToConstant: 114),
            progressView.heightAnchor.constraint(equalToConstant: 8),
            progressView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0.5),
            progressView.topAnchor.constraint(equalTo: self.topAnchor, constant: 72)
        ])
        
        NSLayoutConstraint.activate([
            labelStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 185),
            labelStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 28),
            labelStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40),
            labelStackView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: labelStackView.bottomAnchor, constant: 27),
            passwordTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
            passwordTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        NSLayoutConstraint.activate([
            changePasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 372),
            changePasswordButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            changePasswordButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            changePasswordButton.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        NSLayoutConstraint.activate([
            loginStackView.topAnchor.constraint(equalTo: changePasswordButton.bottomAnchor, constant: 40),
            loginStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 101),
            loginStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -102),
            loginStackView.heightAnchor.constraint(equalToConstant: 14)
        ])
    }
    
    private func setupGradient() {
        changePasswordButton.backgroundGradientLayer.frame = CGRect(x: 0, y: 0,
                                                                    width: changePasswordButton.bounds.size.width,
                                                                    height: changePasswordButton.bounds.size.height)
    }
}
