//
//  ForgotPasswordLastPageView.swift
//  greenbank-ios1
//
//  Created by Hovo Ohanyan on 22.01.24.
//

import UIKit
import GreenBank_UIComponents

final class ForgotPasswordLastPageView: UIView {
    
    private let progressView = ProgressView(pageNumber: 4)
    
    private let pageTitileLabel = UILabel(text: "forgot_password_last_page_title".localized,
                                          textColor: .sysBlack, font: UIFont.SFProSemiBold(size: 29))
    
    private let imageView = UIImageView(image: UIImage(named: "forgotPasswordPageImage"))
    
    let loginButton = PrimaryButton(title: "login_label".localized, titleColor: .white)
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupGradient()
    }
    
    func setupUI() {
        self.backgroundColor = .white
        
        progressView.translatesAutoresizingMaskIntoConstraints = false
        pageTitileLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        pageTitileLabel.numberOfLines = 0
        pageTitileLabel.textAlignment = .center
        
        self.addSubview(progressView)
        self.addSubview(pageTitileLabel)
        self.addSubview(imageView)
        self.addSubview(loginButton)
        
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
            pageTitileLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 185),
            pageTitileLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 33),
            pageTitileLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -34),
            pageTitileLabel.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: pageTitileLabel.bottomAnchor, constant: 83),
            imageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16.58),
            imageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -18.42),
            imageView.heightAnchor.constraint(equalToConstant: 199)
        ])
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 196),
            loginButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            loginButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func setupGradient() {
        loginButton.backgroundGradientLayer.frame = CGRect(x: 0, y: 0,
                                                           width: loginButton.bounds.size.width,
                                                           height: loginButton.bounds.size.height)
    }
}
