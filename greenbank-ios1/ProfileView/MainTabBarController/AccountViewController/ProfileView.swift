//
//  AccountView.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 31.01.24.
//

import UIKit
import GreenBank_UIComponents

class ProfileView: UIView {

    public let navigationBar = NavigationBar(titleText: "profileScreen_header".localized)
    public let settingsButton = UIButton(type: .system)
    public let topBackground = UIImageView(image: UIImage(named: "topBackground_Image".localized))
    public let userPhotoView = ProfileUserView(userImage: UIImage(named: "jon")!, hideChangeButton: false)
    
    public var userNameLabel = UILabel(text: "Fred Butovski",
                                       textColor: .black,
                                       font: .SFProSemiBold(size: 24))
    public var mailAndNumberLabel = UILabel(text: "annbutovski@gmail.com | +374 77 77 77",
                                            textColor: .lightGray,
                                            font: .SFProRegular(size: 12))
    
    private let persInfoLabel = UILabel(text: "personalInfo_Header".localized,
                                        textColor: .black,
                                        font: .SFProSemiBold(size: 14))
    
    public var firstNameView = PersonalInfoView(leftText: "firstName_Text".localized,
                                                rightText: "")
    public var lastNameView = PersonalInfoView(leftText: "lastName_Text".localized,
                                               rightText: "")
    public var emailView = PersonalInfoView(leftText: "email_Text".localized,
                                               rightText: "")
    public var mobileView = PersonalInfoView(leftText: "mobile_Text".localized,
                                               rightText: "+374 77 77 77 00")
    
    public let submitButton = PrimaryButton(title: "submit_Button".localized, titleColor: .white)
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupGradient()
    }
    
    public func setupUI() {
        
        userNameLabel.textAlignment = .center
        mailAndNumberLabel.textAlignment = .center
        settingsButton.setImage(UIImage(named: "settings_Image".localized), for: .normal)
        
        let labelsStackView = UIStackView(arrangedSubviews: [userNameLabel,
                                                                    mailAndNumberLabel],
                                                 axis: .vertical,
                                                 spacing: 6)
        let infoViewsStackView = UIStackView(arrangedSubviews: [firstNameView,
                                                                lastNameView,
                                                                emailView,
                                                                mobileView],
                                             axis: .vertical,
                                             spacing: 6.26)
        
        self.backgroundColor = .sysMainWhite
        
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        topBackground.translatesAutoresizingMaskIntoConstraints = false
        userPhotoView.translatesAutoresizingMaskIntoConstraints = false
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        persInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        firstNameView.translatesAutoresizingMaskIntoConstraints = false
        lastNameView.translatesAutoresizingMaskIntoConstraints = false
        emailView.translatesAutoresizingMaskIntoConstraints = false
        mobileView.translatesAutoresizingMaskIntoConstraints = false
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        
        navigationBar.setupConstraints()
        navigationBar.greenView.isHidden = true
        userPhotoView.setupUI()
        
        self.addSubview(topBackground)
        self.addSubview(navigationBar)
        self.addSubview(settingsButton)
        self.addSubview(userPhotoView)
        self.addSubview(labelsStackView)
        self.addSubview(persInfoLabel)
        self.addSubview(firstNameView)
        self.addSubview(lastNameView)
        self.addSubview(emailView)
        self.addSubview(mobileView)
        self.addSubview(submitButton)
        
        NSLayoutConstraint.activate([
            topBackground.topAnchor.constraint(equalTo: self.topAnchor),
            topBackground.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            topBackground.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            topBackground.heightAnchor.constraint(equalToConstant: 186)
        ])
        
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: self.topAnchor, constant: 65),
            navigationBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            navigationBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            navigationBar.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            settingsButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 65),
            settingsButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            settingsButton.heightAnchor.constraint(equalToConstant: 24),
            settingsButton.widthAnchor.constraint(equalToConstant: 24)
        ])
        
        NSLayoutConstraint.activate([
            userPhotoView.widthAnchor.constraint(equalToConstant: 143.67),
            userPhotoView.heightAnchor.constraint(equalToConstant: 142),
            userPhotoView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            userPhotoView.topAnchor.constraint(equalTo: self.topAnchor, constant: 112),
        ])
        
        NSLayoutConstraint.activate([
            labelsStackView.topAnchor.constraint(equalTo: userPhotoView.bottomAnchor, constant: 21),
            labelsStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            labelsStackView.widthAnchor.constraint(equalToConstant: 282),
            labelsStackView.heightAnchor.constraint(equalToConstant: 54)
        ])
        
        NSLayoutConstraint.activate([
            persInfoLabel.topAnchor.constraint(equalTo: labelsStackView.bottomAnchor, constant: 52),
            persInfoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            persInfoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -135.97),
            persInfoLabel.heightAnchor.constraint(equalToConstant: 17)
        ])
        
        NSLayoutConstraint.activate([
            firstNameView.topAnchor.constraint(equalTo: labelsStackView.bottomAnchor, constant: 87),
            firstNameView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            firstNameView.widthAnchor.constraint(equalToConstant: 361),
            firstNameView.heightAnchor.constraint(equalToConstant: 41.44)
        ])
        
        NSLayoutConstraint.activate([
            lastNameView.topAnchor.constraint(equalTo: firstNameView.bottomAnchor, constant: 6.26),
            lastNameView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            lastNameView.widthAnchor.constraint(equalToConstant: 361),
            lastNameView.heightAnchor.constraint(equalToConstant: 41.44)
        ])
        
        NSLayoutConstraint.activate([
            emailView.topAnchor.constraint(equalTo: lastNameView.bottomAnchor, constant: 6.26),
            emailView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            emailView.widthAnchor.constraint(equalToConstant: 361),
            emailView.heightAnchor.constraint(equalToConstant: 41.44)
        ])
        
        NSLayoutConstraint.activate([
            mobileView.topAnchor.constraint(equalTo: emailView.bottomAnchor, constant: 6.26),
            mobileView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            mobileView.widthAnchor.constraint(equalToConstant: 361),
            mobileView.heightAnchor.constraint(equalToConstant: 41.44)
        ])
        
        NSLayoutConstraint.activate([
            submitButton.topAnchor.constraint(equalTo: mobileView.bottomAnchor, constant: 73.88),
            submitButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            submitButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            submitButton.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
    
    func setupGradient() {
        submitButton.backgroundGradientLayer.frame = CGRect(x: 0, y: 0,
                                                           width: submitButton.bounds.size.width,
                                                           height: submitButton.bounds.size.height)
    }
    
    public func setupProfileUser(userFirstName: String,
                                 userLastName: String,
                                 userMobile: String,
                                 userEmail: String) {
        self.userNameLabel.text = "\(userFirstName) \(userLastName)"
        self.firstNameView.rightText.text = "\(userFirstName)"
        self.lastNameView.rightText.text = "\(userLastName)"
        self.emailView.rightText.text = "\(userEmail)"
        self.mobileView.rightText.text = "\(userMobile)"
        self.mailAndNumberLabel.text = "\(userEmail) | \(userMobile)"
    }
}
