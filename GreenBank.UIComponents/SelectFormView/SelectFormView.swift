//
//  SelectFormView.swift
//  GreenBank.UIComponents
//
//  Created by Er Baghdasaryan on 11.03.24.
//

import UIKit

public class SelectFormView: UIView {
    
    public let cardForm = FormView(image: UIImage(named: "card_Image".localized)!, text: "card_Form".localized)
    public let accountForm = FormView(image: UIImage(named: "account_Image".localized)!, text: "account_Form".localized)
    public let phoneForm = FormView(image: UIImage(named: "phone_Image".localized)!, text: "phone_Form".localized)
    public let qrForm = FormView(image: UIImage(named: "qr_image".localized)!, text: "qr_Form".localized)
    
    private let cardShadow = UIView()
    private let accountShadow = UIView()
    private let phoneShadow = UIView()
    private let qrShadow = UIView()
    
    public init() {
        super.init(frame: .zero)
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupUI() {
        cardShadow.shadow()
        cardShadow.backgroundColor = .white
        cardShadow.layer.cornerRadius = 10
        
        accountShadow.shadow()
        accountShadow.backgroundColor = .white
        accountShadow.layer.cornerRadius = 10
        
        phoneShadow.shadow()
        phoneShadow.backgroundColor = .white
        phoneShadow.layer.cornerRadius = 10
        
        qrShadow.shadow()
        qrShadow.backgroundColor = .white
        qrShadow.layer.cornerRadius = 10
        
        let row1Shadow = createStackView(with: [cardShadow, accountShadow])
        let row2Shadow = createStackView(with: [phoneShadow, qrShadow])
        
        let row1StackView = createStackView(with: [cardForm, accountForm])
        let row2StackView = createStackView(with: [phoneForm, qrForm])
        
        let mainShadow = UIStackView(arrangedSubviews: [row1Shadow, row2Shadow])
        let mainStackView = UIStackView(arrangedSubviews: [row1StackView, row2StackView])
        
        mainShadow.axis = .vertical
        mainShadow.alignment = .fill
        mainShadow.distribution = .fillEqually
        mainShadow.spacing = 25
        
        mainStackView.axis = .vertical
        mainStackView.alignment = .fill
        mainStackView.distribution = .fillEqually
        mainStackView.spacing = 25
        
        addSubview(mainShadow)
        mainShadow.addSubview(mainStackView)
        
        mainShadow.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainShadow.topAnchor.constraint(equalTo: topAnchor),
            mainShadow.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainShadow.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainShadow.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func createStackView(with forms: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: forms)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 33
        
        return stackView
    }
}
