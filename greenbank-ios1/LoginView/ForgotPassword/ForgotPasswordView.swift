//
//  ForgotPasswordView.swift
//  greenbank-ios1
//
//  Created by Hovo Ohanyan on 21.01.24.
//

import UIKit
import GreenBank_UIComponents

final class ForgotPasswordView: UIView {
    
    private let progressView = ProgressView(pageNumber: 1)
    
    private let forgotViewTitleLabel = UILabel(text: "forgot_page_title".localized, textColor: .sysBlack,
                                               font: UIFont.SFProBold(size: 20))
    
    private let forgotViewHelperTitleLabel = UILabel(text: "forgot_page_helper_title".localized, textColor: .sysGray,
                                                     font: UIFont.SFProMedium(size: 12))
    
    private let loginLabel = UILabel(text: "login_helper_label".localized, textColor: .sysGray,
                                     font: UIFont.SFProSemiBold(size: 12))
    
    let emailTextField = SystemTextField(labelText: "email_label".localized,
                                         placeholder: "email_placeholder".localized)
    
    let continueButton = PrimaryButton(title: "continue_title".localized, titleColor: .white)
    
    let loginButton = SecondaryButton(title: "login_label".localized, titleColor: .sysBlack,
                                      titleFont: UIFont.SFProSemiBold(size: 12))
    
    lazy private var labelStackView = UIStackView(arrangedSubviews: [forgotViewTitleLabel, forgotViewHelperTitleLabel])
    lazy private var loginStackView = UIStackView(arrangedSubviews: [loginLabel, loginButton])
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupGradient()
    }
    
    func setupUI() {
        self.backgroundColor = .white
        
        progressView.translatesAutoresizingMaskIntoConstraints = false
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        loginStackView.translatesAutoresizingMaskIntoConstraints = false
        
        labelStackView.axis = .vertical
        labelStackView.spacing = 3
        labelStackView.distribution = .fillProportionally
        
        loginStackView.axis = .horizontal
        loginStackView.spacing = 0
        loginStackView.distribution = .fillProportionally
        
        self.addSubview(progressView)
        self.addSubview(emailTextField)
        self.addSubview(labelStackView)
        self.addSubview(continueButton)
        self.addSubview(loginStackView)
        
        autoLayoutConfiguration()
    }
    
    private func autoLayoutConfiguration() {
        NSLayoutConstraint.activate([
            progressView.widthAnchor.constraint(equalToConstant: 114),
            progressView.heightAnchor.constraint(equalToConstant: 8),
            progressView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0.5),
            progressView.topAnchor.constraint(equalTo: self.topAnchor, constant: 72)
        ])
        
        NSLayoutConstraint.activate([
            labelStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 191),
            labelStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 22),
            labelStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -44),
            labelStackView.heightAnchor.constraint(equalToConstant: 43)
        ])
        
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: labelStackView.bottomAnchor, constant: 68),
            emailTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            emailTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            emailTextField.heightAnchor.constraint(equalToConstant: 65)
        ])
        
        NSLayoutConstraint.activate([
            continueButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 360),
            continueButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            continueButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            continueButton.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        NSLayoutConstraint.activate([
            loginStackView.topAnchor.constraint(equalTo: continueButton.bottomAnchor, constant: 40),
            loginStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 101),
            loginStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -102),
            loginStackView.heightAnchor.constraint(equalToConstant: 14)
        ])
    }
    
    private func setupGradient() {
        continueButton.backgroundGradientLayer.frame = CGRect(x: 0, y: 0,
                                                              width: continueButton.bounds.size.width,
                                                              height: continueButton.bounds.size.height)
    }
}
