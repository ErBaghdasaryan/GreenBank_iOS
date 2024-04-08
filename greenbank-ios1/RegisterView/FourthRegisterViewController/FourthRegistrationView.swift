//
//  FourthRegisterView.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 25.01.24.
//

import UIKit
import GreenBank_UIComponents

final class FourthRegisterView: UIView {
    
    var progressView = ProgressView(pageNumber: 4)
    
    var finalHeaderLabel = UILabel(text: "register_finalHeaderLabel_title".localized,
                                    textColor: UIColor.sysBlack,
                                    font: UIFont.SFProSemiBold(size: 36))
    
    var finalAfterHeaderLabel = UILabel(text: "register_finalAfterHeaderLabel_title".localized,
                                     textColor: UIColor.sysGray,
                                     font: UIFont.SFProMedium(size: 14))
    
    var backgroundImage = UIImageView(image: UIImage(named: "regiter_lastPage_backgroundImgae".localized))

    public var logInButton = PrimaryButton(title: "register_page_logInButton_title".localized, titleColor: UIColor.white)
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        setupGradient()
    }
    
    public func setupUI() {
        finalHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        finalAfterHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        progressView.translatesAutoresizingMaskIntoConstraints = false
        
        self.backgroundColor = .white
        finalHeaderLabel.textAlignment = .center
        finalAfterHeaderLabel.numberOfLines = 0
        finalAfterHeaderLabel.textAlignment = .center
        
        self.addSubview(progressView)
        self.addSubview(finalHeaderLabel)
        self.addSubview(finalAfterHeaderLabel)
        self.addSubview(logInButton)
        self.addSubview(backgroundImage)
        
        logInButton.setupGradient()
        
        NSLayoutConstraint.activate([
            progressView.widthAnchor.constraint(equalToConstant: 114),
            progressView.heightAnchor.constraint(equalToConstant: 8),
            progressView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0.5),
            progressView.topAnchor.constraint(equalTo: self.topAnchor, constant: 72),
        ])
        
        NSLayoutConstraint.activate([
            finalHeaderLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 140),
            finalHeaderLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 68.5),
            finalHeaderLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -68.5),
            finalHeaderLabel.heightAnchor.constraint(equalToConstant: 43)
        ])
        
        NSLayoutConstraint.activate([
            finalAfterHeaderLabel.topAnchor.constraint(equalTo: finalHeaderLabel.bottomAnchor, constant: 7),
            finalAfterHeaderLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 58),
            finalAfterHeaderLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -58),
            finalAfterHeaderLabel.heightAnchor.constraint(equalToConstant: 34)
        ])
        
        NSLayoutConstraint.activate([
            logInButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 721),
            logInButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            logInButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15),
            logInButton.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        NSLayoutConstraint.activate([
            backgroundImage.widthAnchor.constraint(equalToConstant: 289),
            backgroundImage.heightAnchor.constraint(equalToConstant: 289),
            backgroundImage.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -6),
            backgroundImage.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -0.5),
        ])
    }
    
    private func setupGradient() {
        logInButton.backgroundGradientLayer.frame = CGRect(x: 0, y: 0,
                                                              width: logInButton.bounds.size.width,
                                                              height: logInButton.bounds.size.height)
    }
}
