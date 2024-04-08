//
//  ThirdRegistrationView.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 25.01.24.
//

import UIKit
import GreenBank_UIComponents

final class ThirdRegistrationView: UIView {
    
    private let progressView = ProgressView(pageNumber: 3)
    
    private let pageTitileLabel = UILabel(text: "register_thirdPage_header".localized,
                                          textColor: .sysBlack, font: UIFont.SFProMedium(size: 16))
    
    private let pageHelperTitleLabel = UILabel(text: "register_thirdPage_afterHeader".localized,
                                               textColor: .sysGray, font: UIFont.SFProMedium(size: 14))
    public var registerButton = PrimaryButton(title: "register_page_registerButton_title".localized, titleColor: UIColor.white)
    
    private let logInLabel = UILabel(text: "login_page_registration_label".localized, textColor: .sysGray,
                                      font: UIFont.SFProSemiBold(size: 12))
    
    public let logInButton = SecondaryButton(title: "register_page_logInButton_title".localized, titleColor: .sysBlack,
                                               titleFont: UIFont.SFProSemiBold(size: 12))
    
    let firstTextField = UITextField(isVerificationTextField: true)
    let secondTextField = UITextField(isVerificationTextField: true)
    let thirdTextField = UITextField(isVerificationTextField: true)
    let fourthTextField = UITextField(isVerificationTextField: true)
    
    lazy var textFieldStackView = UIStackView(arrangedSubviews: [firstTextField, secondTextField,
                                                                 thirdTextField, fourthTextField])
    lazy private var labelStackView = UIStackView(arrangedSubviews: [pageTitileLabel, pageHelperTitleLabel])
    lazy private var logInStackView = UIStackView(arrangedSubviews: [logInLabel, logInButton])
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        setupGradient()
    }
    
    public func setupUI() {
        
        progressView.translatesAutoresizingMaskIntoConstraints = false
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        textFieldStackView.translatesAutoresizingMaskIntoConstraints = false
        logInStackView.translatesAutoresizingMaskIntoConstraints = false
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.backgroundColor = .white
        
        logInLabel.textAlignment = .right
    
        self.layer.cornerRadius = 40
        
        pageTitileLabel.textAlignment = .center
        pageTitileLabel.numberOfLines = 0
        
        textFieldStackView.axis = .horizontal
        textFieldStackView.spacing = 18
        textFieldStackView.distribution = .fillEqually
        
        labelStackView.axis = .vertical
        labelStackView.spacing = 8
        labelStackView.distribution = .fillProportionally
        
        logInStackView.axis = .horizontal
        logInStackView.spacing = -1
        logInStackView.distribution = .fillProportionally
        
        pageHelperTitleLabel.textAlignment = .center
        
        self.addSubview(progressView)
        self.addSubview(labelStackView)
        self.addSubview(textFieldStackView)
        self.addSubview(logInStackView)
        self.addSubview(registerButton)
        registerButton.setupGradient()
        logInStackView.spacing = 10
        
        pageTitileLabel.textAlignment = .center
        pageTitileLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            progressView.widthAnchor.constraint(equalToConstant: 114),
            progressView.heightAnchor.constraint(equalToConstant: 8),
            progressView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            progressView.topAnchor.constraint(equalTo: self.topAnchor, constant: 25)
        ])
        
        NSLayoutConstraint.activate([
            labelStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 85),
            labelStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
            labelStackView.widthAnchor.constraint(equalToConstant: 223),
            labelStackView.heightAnchor.constraint(equalToConstant: 65)
        ])
        
        NSLayoutConstraint.activate([
            textFieldStackView.widthAnchor.constraint(equalToConstant: 245),
            textFieldStackView.heightAnchor.constraint(equalToConstant: 45),
            textFieldStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
            textFieldStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 174)
        ])
        
        NSLayoutConstraint.activate([
            registerButton.widthAnchor.constraint(equalToConstant: 362),
            registerButton.heightAnchor.constraint(equalToConstant: 44),
            registerButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0.5),
            registerButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 515),
        ])
        
        NSLayoutConstraint.activate([
            logInStackView.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 50),
            logInStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 80),
            logInStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -125),
            logInStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -14)
        ])
        
    }
    
    private func setupGradient() {
        registerButton.backgroundGradientLayer.frame = CGRect(x: 0, y: 0,
                                                              width: registerButton.bounds.size.width,
                                                              height: registerButton.bounds.size.height)
    }
}
