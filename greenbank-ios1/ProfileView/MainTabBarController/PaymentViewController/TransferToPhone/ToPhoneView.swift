//
//  ToPhoneView.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 03.04.24.
//

import UIKit
import GreenBank_UIComponents

public class ToPhoneView: UIView {
    
    public let navigationBar = NavigationBar(titleText: "transferToPhone_Header".localized.localized)
    public let backGroungImage = UIImageView(image: UIImage(named: "toPhone".localized))
    public let userPhotoView = ProfileUserView(userImage: UIImage(named: "jon")!, hideChangeButton: false)
    
    public var userNameLabel = UILabel(text: "Fred Butovski",
                                       textColor: .black,
                                       font: .SFProSemiBold(size: 24))
    public let chooseAccountTypeTF = AccountPickerView()
    public let amountTextField = SystemTextField(labelText: "amount_label".localized,
                                                 helperLabelText: "",
                                                 placeholder: "amount_placeholder".localized)
    public let creditPhoneTextField = SystemTextField(labelText: "phoneNumber_label".localized,
                                                     helperLabelText: "",
                                                     placeholder: "phoneNumber_placeholder".localized,
                                                    rightImage: "contactImage")
    public let openContactButton = UIButton(type: .system)
    public let messageTextField = SystemTextField(labelText: "message_label".localized,
                                                  helperLabelText: "",
                                                  placeholder: "message_placeholder".localized)
    public let continueButton = PrimaryButton(title: "continue_title".localized,
                                              titleColor: .white)
    var activityIndicartor: UIActivityIndicatorView = {
        let active = UIActivityIndicatorView()
        active.color = .sysMainWhite
        return active
    }()
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        setupGradient()
    }
    
    public func setupUI(withData: AccountEditModel) {
        
        backgroundColor = .white
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        backGroungImage.translatesAutoresizingMaskIntoConstraints = false
        userPhotoView.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        chooseAccountTypeTF.translatesAutoresizingMaskIntoConstraints = false
        amountTextField.translatesAutoresizingMaskIntoConstraints = false
        creditPhoneTextField.translatesAutoresizingMaskIntoConstraints = false
        openContactButton.translatesAutoresizingMaskIntoConstraints = false
        messageTextField.translatesAutoresizingMaskIntoConstraints = false
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        activityIndicartor.translatesAutoresizingMaskIntoConstraints = false
        
        navigationBar.setupConstraints()
        userPhotoView.changePhotoButton.isHidden = true
        userNameLabel.textAlignment = .center
        navigationBar.greenView.isHidden = true
        
        addSubview(navigationBar)
        addSubview(backGroungImage)
        addSubview(userPhotoView)
        addSubview(userNameLabel)
        addSubview(chooseAccountTypeTF)
        addSubview(amountTextField)
        addSubview(creditPhoneTextField)
        addSubview(openContactButton)
        addSubview(messageTextField)
        addSubview(continueButton)
        addSubview(activityIndicartor)
        
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: self.topAnchor, constant: 65),
            navigationBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            navigationBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            navigationBar.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            backGroungImage.topAnchor.constraint(equalTo: navigationBar.bottomAnchor),
            backGroungImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backGroungImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backGroungImage.heightAnchor.constraint(equalToConstant: 114)
        ])
        
        NSLayoutConstraint.activate([
            userPhotoView.widthAnchor.constraint(equalToConstant: 184),
            userPhotoView.heightAnchor.constraint(equalToConstant: 184),
            userPhotoView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            userPhotoView.topAnchor.constraint(equalTo: self.topAnchor, constant: 142),
        ])
        
        NSLayoutConstraint.activate([
            userNameLabel.topAnchor.constraint(equalTo: userPhotoView.bottomAnchor, constant: 3),
            userNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            userNameLabel.widthAnchor.constraint(equalToConstant: 282),
            userNameLabel.heightAnchor.constraint(equalToConstant: 54)
        ])
        
        NSLayoutConstraint.activate([
            chooseAccountTypeTF.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 8),
            chooseAccountTypeTF.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            chooseAccountTypeTF.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            chooseAccountTypeTF.heightAnchor.constraint(equalToConstant: 85),
        ])
        
        NSLayoutConstraint.activate([
            amountTextField.topAnchor.constraint(equalTo: chooseAccountTypeTF.bottomAnchor, constant: 2),
            amountTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            amountTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            amountTextField.heightAnchor.constraint(equalToConstant: 85),
        ])
        
        NSLayoutConstraint.activate([
            creditPhoneTextField.topAnchor.constraint(equalTo: amountTextField.bottomAnchor, constant: 2),
            creditPhoneTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            creditPhoneTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            creditPhoneTextField.heightAnchor.constraint(equalToConstant: 85),
        ])
        
        NSLayoutConstraint.activate([
            openContactButton.topAnchor.constraint(equalTo: creditPhoneTextField.textField.topAnchor),
            openContactButton.leadingAnchor.constraint(equalTo: creditPhoneTextField.textField.leadingAnchor, constant: 150),
            openContactButton.rightAnchor.constraint(equalTo: self.creditPhoneTextField.textField.rightAnchor, constant: -4),
            openContactButton.heightAnchor.constraint(equalToConstant: 24),
        ])
        
        NSLayoutConstraint.activate([
            messageTextField.topAnchor.constraint(equalTo: creditPhoneTextField.bottomAnchor, constant: 2),
            messageTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            messageTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            messageTextField.heightAnchor.constraint(equalToConstant: 85),
        ])
        
        NSLayoutConstraint.activate([
            continueButton.topAnchor.constraint(equalTo: messageTextField.bottomAnchor, constant: 10),
            continueButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            continueButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            continueButton.heightAnchor.constraint(equalToConstant: 44),
        ])
        
        NSLayoutConstraint.activate([
            activityIndicartor.centerXAnchor.constraint(equalTo: self.continueButton.centerXAnchor),
            activityIndicartor.centerYAnchor.constraint(equalTo: self.continueButton.centerYAnchor)
        ])
    }
    
    func setupGradient() {
        continueButton.backgroundGradientLayer.frame = CGRect(x: 0, y: 0,
                                                           width: continueButton.bounds.size.width,
                                                           height: continueButton.bounds.size.height)
    }
    
    public func updateUI(name: String, lastName: String) {
        self.userNameLabel.text = "\(name) \(lastName)"
    }
}
