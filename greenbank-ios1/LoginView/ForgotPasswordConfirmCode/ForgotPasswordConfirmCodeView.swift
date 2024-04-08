//
//  ForgotPasswordConfirmCodeView.swift
//  greenbank-ios1
//
//  Created by Hovo Ohanyan on 22.01.24.
//

import UIKit
import GreenBank_UIComponents

final class ForgotPasswordConfirmCodeView: UIView {
    
    private let progressView = ProgressView(pageNumber: 2)
    
    private let pageTitileLabel = UILabel(text: "forgot_password_code_confirm_title".localized,
                                          textColor: .sysBlack, font: UIFont.SFProBold(size: 24))
    
    private let pageHelperTitleLabel = UILabel(text: "forgot_password_code_confirm_helper_title".localized,
                                               textColor: .sysGray, font: UIFont.SFProMedium(size: 20))
    
    private let loginLabel = UILabel(text: "login_helper_label".localized, textColor: .sysGray,
                                     font: UIFont.SFProSemiBold(size: 12))
    
    let firstTextField = UITextField(isVerificationTextField: true)
    let secondTextField = UITextField(isVerificationTextField: true)
    let thirdTextField = UITextField(isVerificationTextField: true)
    let fourthTextField = UITextField(isVerificationTextField: true)
    
    let continueButton = PrimaryButton(title: "continue_title".localized, titleColor: .white)
    
    let loginButton = SecondaryButton(title: "login_label".localized, titleColor: .sysBlack,
                                      titleFont: UIFont.SFProSemiBold(size: 12))
    
    lazy var textFieldStackView = UIStackView(arrangedSubviews: [firstTextField, secondTextField,
                                                                 thirdTextField, fourthTextField])
    
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
        textFieldStackView.translatesAutoresizingMaskIntoConstraints = false
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        loginStackView.translatesAutoresizingMaskIntoConstraints = false
        
        textFieldStackView.axis = .horizontal
        textFieldStackView.spacing = 18
        textFieldStackView.distribution = .fillEqually
        
        labelStackView.axis = .vertical
        labelStackView.spacing = 8
        labelStackView.distribution = .fillProportionally
        
        loginStackView.axis = .horizontal
        loginStackView.spacing = 0
        loginStackView.distribution = .fillProportionally
        
        pageTitileLabel.textAlignment = .center
        pageTitileLabel.numberOfLines = 0
        
        pageHelperTitleLabel.textAlignment = .center
        
        self.addSubview(progressView)
        self.addSubview(textFieldStackView)
        self.addSubview(labelStackView)
        self.addSubview(continueButton)
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
            labelStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 188),
            labelStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 39),
            labelStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -39),
            labelStackView.heightAnchor.constraint(equalToConstant: 90)
        ])
        
        NSLayoutConstraint.activate([
            textFieldStackView.topAnchor.constraint(equalTo: labelStackView.bottomAnchor, constant: 43),
            textFieldStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 73),
            textFieldStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -75),
            textFieldStackView.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        NSLayoutConstraint.activate([
            continueButton.topAnchor.constraint(equalTo: textFieldStackView.bottomAnchor, constant: 348),
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
