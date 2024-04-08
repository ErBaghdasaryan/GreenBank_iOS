//
//  EditAccountView.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 05.03.24.
//

import UIKit
import GreenBank_UIComponents

final class EditAccountView: UIView {
    var accountView = UIView()
    var accountViewFrame = CGRect()
    
    public let navigationBar = NavigationBar(titleText: "label_Account".localized)

    public let cardHolderNameTextField = SystemTextField(labelText: "accounHolder_Name".localized, helperLabelText: "",
                                                         placeholder: "holder_PlaceHolder".localized)
    public var currencyPickerView = CurrencyPickerView()
    
    let continueButton = PrimaryButton(title: "button_continue_title".localized, titleColor: .white)
    
    var activityIndicartor: UIActivityIndicatorView = {
        let active = UIActivityIndicatorView()
        active.color = .sysMainWhite
        return active
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupGradient()
    }
    
    func setupUI(withData: EditModel) {
        makeEffect()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let currencyPicker = CurrencyPicker(imageName: "chevron.down", placeholder: "USD",
                                                currencyData: withData.currency)
            
            self.currencyPickerView.setupUI(withText: "currency_Header".localized, currencyPicker: currencyPicker)
            self.backgroundColor = .sysMainWhite
            
            self.cardHolderNameTextField.translatesAutoresizingMaskIntoConstraints = false
            self.currencyPickerView.translatesAutoresizingMaskIntoConstraints = false
            self.continueButton.translatesAutoresizingMaskIntoConstraints = false
            self.navigationBar.translatesAutoresizingMaskIntoConstraints = false
            self.activityIndicartor.translatesAutoresizingMaskIntoConstraints = false
            
            self.currencyPickerView.alpha = 0
            self.cardHolderNameTextField.alpha = 0
            self.continueButton.alpha = 0
            self.navigationBar.alpha = 0
            
            self.addSubview(self.continueButton)
            self.addSubview(self.cardHolderNameTextField)
            self.addSubview(self.currencyPickerView)
            self.addSubview(self.navigationBar)
            self.addSubview(self.activityIndicartor)

            self.makeAutoLayout()
        }
    }
    
    func makeAutoLayout() {
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: self.topAnchor, constant: 65),
            navigationBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            navigationBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            navigationBar.heightAnchor.constraint(equalToConstant: 50)
        ])
                
        NSLayoutConstraint.activate([
            cardHolderNameTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 349),
            cardHolderNameTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            cardHolderNameTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            cardHolderNameTextField.heightAnchor.constraint(equalToConstant: 85),
        ])
    
        NSLayoutConstraint.activate([
            currencyPickerView.topAnchor.constraint(equalTo: cardHolderNameTextField.bottomAnchor),
            currencyPickerView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            currencyPickerView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            currencyPickerView.heightAnchor.constraint(equalToConstant: 150),
        ])
        
        NSLayoutConstraint.activate([
            continueButton.topAnchor.constraint(equalTo: currencyPickerView.bottomAnchor, constant: 138),
            continueButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            continueButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            continueButton.heightAnchor.constraint(equalToConstant: 44),
        ])
        
        NSLayoutConstraint.activate([
            activityIndicartor.centerXAnchor.constraint(equalTo: continueButton.centerXAnchor),
            activityIndicartor.centerYAnchor.constraint(equalTo: continueButton.centerYAnchor),
        ])
    }
    
    func makeEffect() {
        let backGroundView = BackgroundView()
        backGroundView.backgroundColor = .green
        backGroundView.frame = self.frame
        
        backGroundView.setupUI()
        self.navigationBar.setupConstraints()
        self.addSubview(backGroundView)
        self.accountView.frame = accountViewFrame
        self.addSubview(self.accountView)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
            UIView.animate(withDuration: 0.6) {
                backGroundView.alpha = 0
                self.accountView.center.x = self.center.x
                self.accountView.center.y = 250
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                backGroundView.removeFromSuperview()
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                UIView.animate(withDuration: 0.6) {
                    self.continueButton.alpha = 1
                    self.cardHolderNameTextField.alpha = 1
                    self.currencyPickerView.alpha = 1
                    self.navigationBar.alpha = 1
                }
            }
        }
    }
    
    func setupGradient() {
        continueButton.backgroundGradientLayer.frame = CGRect(x: 0, y: 0,
                                                           width: continueButton.bounds.size.width,
                                                           height: continueButton.bounds.size.height)
    }
}
