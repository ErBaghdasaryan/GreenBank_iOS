//
//  EditCardView.swift
//  greenbank-ios1
//
//  Created by Hovo Ohanyan on 08.02.24.
//

import UIKit
import GreenBank_UIComponents

final class EditCardView: UIView {   
    var cardView = UIView()
    var cardViewFrame = CGRect()
    
    public let navigationBar = NavigationBar(titleText: "label_Cards".localized)
    
    private let masterCardImageView = UIImageView(image: UIImage(named: 
                                                                    "masterCard_Image".localized))
    private let visaCardImageView = UIImageView(image: UIImage(named: "visaCard_Image".localized))
    
    public let cardHolderNameTextField = SystemTextField(labelText: "cardHolder_Name".localized, helperLabelText: "",
                                                         placeholder: "holder_PlaceHolder".localized)
    public var currencyPickerView = CurrencyPickerView()
    
    let continueButton = PrimaryButton(title: "button_continue_title".localized, titleColor: .white)
    
    lazy private var imageStackView = UIStackView(arrangedSubviews: [masterCardImageView, visaCardImageView],
                                                  axis: .horizontal, spacing: 100)
    public let selectCardTypeMaster = UIButton(type: .system)
    public let selectCardTypeVisa = UIButton(type: .system)
    public var wrongCardTypeLabel = UILabel(text: "", textColor: .sysFalseTFBorder, font: .SFProMedium(size: 14))
    
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
            self.customizeSelecdCardTypeButtons()
            self.wrongCardTypeLabel.textAlignment = .center
            
            self.cardHolderNameTextField.translatesAutoresizingMaskIntoConstraints = false
            self.currencyPickerView.translatesAutoresizingMaskIntoConstraints = false
            self.imageStackView.translatesAutoresizingMaskIntoConstraints = false
            self.continueButton.translatesAutoresizingMaskIntoConstraints = false
            self.navigationBar.translatesAutoresizingMaskIntoConstraints = false
            self.activityIndicartor.translatesAutoresizingMaskIntoConstraints = false
            self.selectCardTypeVisa.translatesAutoresizingMaskIntoConstraints = false
            self.selectCardTypeMaster.translatesAutoresizingMaskIntoConstraints = false
            self.wrongCardTypeLabel.translatesAutoresizingMaskIntoConstraints = false
            
            self.currencyPickerView.alpha = 0
            self.imageStackView.alpha = 0
            self.cardHolderNameTextField.alpha = 0
            self.continueButton.alpha = 0
            self.navigationBar.alpha = 0
            self.selectCardTypeVisa.alpha = 0
            self.selectCardTypeMaster.alpha = 0
            self.wrongCardTypeLabel.alpha = 0
            
            self.addSubview(self.continueButton)
            self.addSubview(self.cardHolderNameTextField)
            self.addSubview(self.imageStackView)
            self.addSubview(self.currencyPickerView)
            self.addSubview(self.navigationBar)
            self.addSubview(self.activityIndicartor)
            self.addSubview(self.selectCardTypeVisa)
            self.addSubview(self.selectCardTypeMaster)
            self.addSubview(self.wrongCardTypeLabel)

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
            imageStackView.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 39.53),
            imageStackView.leftAnchor.constraint(equalTo: cardView.leftAnchor),
            imageStackView.rightAnchor.constraint(equalTo: cardView.rightAnchor),
            imageStackView.heightAnchor.constraint(equalToConstant: 55),
        ])
                
        NSLayoutConstraint.activate([
            cardHolderNameTextField.topAnchor.constraint(equalTo: imageStackView.bottomAnchor, constant: 56.14),
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
            continueButton.topAnchor.constraint(equalTo: currencyPickerView.bottomAnchor),
            continueButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            continueButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            continueButton.heightAnchor.constraint(equalToConstant: 44),
        ])
        
        NSLayoutConstraint.activate([
            activityIndicartor.centerXAnchor.constraint(equalTo: continueButton.centerXAnchor),
            activityIndicartor.centerYAnchor.constraint(equalTo: continueButton.centerYAnchor),
        ])
        
        NSLayoutConstraint.activate([
            selectCardTypeMaster.topAnchor.constraint(equalTo: masterCardImageView.bottomAnchor, constant: 13),
            selectCardTypeMaster.centerXAnchor.constraint(equalTo: masterCardImageView.centerXAnchor),
            selectCardTypeMaster.heightAnchor.constraint(equalToConstant: 16),
            selectCardTypeMaster.widthAnchor.constraint(equalToConstant: 16)
        ])
        
        NSLayoutConstraint.activate([
            selectCardTypeVisa.topAnchor.constraint(equalTo: visaCardImageView.bottomAnchor, constant: 13),
            selectCardTypeVisa.centerXAnchor.constraint(equalTo: visaCardImageView.centerXAnchor),
            selectCardTypeVisa.heightAnchor.constraint(equalToConstant: 16),
            selectCardTypeVisa.widthAnchor.constraint(equalToConstant: 16)
        ])
        
        NSLayoutConstraint.activate([
            wrongCardTypeLabel.topAnchor.constraint(equalTo: continueButton.bottomAnchor, constant: 10),
            wrongCardTypeLabel.leadingAnchor.constraint(equalTo: continueButton.leadingAnchor, constant: 0),
            wrongCardTypeLabel.trailingAnchor.constraint(equalTo: continueButton.trailingAnchor, constant: 0)
        ])
    }
    
    func makeEffect() {
        let backGroundView = BackgroundView()
        backGroundView.backgroundColor = .green
        backGroundView.frame = self.frame
        
        backGroundView.setupUI()
        self.navigationBar.setupConstraints()
        self.addSubview(backGroundView)
        self.cardView.frame = cardViewFrame
        self.addSubview(self.cardView)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
            UIView.animate(withDuration: 0.6) {
                backGroundView.alpha = 0
                self.cardView.center.x = self.center.x
                self.cardView.center.y = 250
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                backGroundView.removeFromSuperview()
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                UIView.animate(withDuration: 0.6) {
                    self.continueButton.alpha = 1
                    self.imageStackView.alpha = 1
                    self.cardHolderNameTextField.alpha = 1
                    self.currencyPickerView.alpha = 1
                    self.navigationBar.alpha = 1
                    self.selectCardTypeVisa.alpha = 1
                    self.selectCardTypeMaster.alpha = 1
                    self.wrongCardTypeLabel.alpha = 1
                }
            }
        }
    }
    
    func setupGradient() {
        continueButton.backgroundGradientLayer.frame = CGRect(x: 0, y: 0,
                                                           width: continueButton.bounds.size.width,
                                                           height: continueButton.bounds.size.height)
    }
    
    public func customizeSelecdCardTypeButtons() {
        selectCardTypeVisa.layer.cornerRadius = 8
        selectCardTypeMaster.layer.cornerRadius = 8
        
        selectCardTypeMaster.layer.masksToBounds = true
        selectCardTypeVisa.layer.masksToBounds = true
        
        selectCardTypeVisa.layer.borderWidth = 1
        selectCardTypeMaster.layer.borderWidth = 1
        
        selectCardTypeVisa.layer.borderColor = UIColor.lightGray.cgColor
        selectCardTypeMaster.layer.borderColor = UIColor.lightGray.cgColor
    }
}
