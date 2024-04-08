//
//  Account.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 04.03.24.
//

import UIKit

final class AccountView: UIView {
    private let currentBalanceLabel = UILabel(text: "account_Header".localized,
                                        
                                        textColor: .sysAccountFirst,
                                        font: UIFont.SFProSemiBold(size: 16))
    private let currencyTypeLabel = UILabel(text: "currency_Usd".localized,
                                            textColor: .sysAccountFirst,
                                            font: .SFProBold(size: 28))
    private let accountBalance = UILabel(text: "$ 000,00",
                                         textColor: .sysAccountFirst,
                                         font: .SFProBold(size: 28))
    
    public let gradientFirstColor: UIColor? = nil
    public let gradientSecondColor: UIColor? = nil
    public let gradientThirdColor: UIColor? = nil
    
    public var backgroundGradientLayer: CAGradientLayer! {
        didSet {
            backgroundGradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
            backgroundGradientLayer.endPoint = CGPoint(x: 1, y: 0.0)
            backgroundGradientLayer.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 0.01, c: -0.09, d: 0, tx: 0.01, ty: 0.01))
            backgroundGradientLayer.locations = [0.11, 0.58, 0.92]
        }
    }

    func setupUI() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 12
        self.backgroundColor = .white
        
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.sysAccountFirst.cgColor
        
        currentBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
        currencyTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        accountBalance.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(currentBalanceLabel)
        self.addSubview(currencyTypeLabel)
        self.addSubview(accountBalance)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            currentBalanceLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 6),
            currentBalanceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14),
            currentBalanceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -174),
            currentBalanceLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -76)
        ])
        
        NSLayoutConstraint.activate([
            currencyTypeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 52),
            currencyTypeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 240),
            currencyTypeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            currencyTypeLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            accountBalance.topAnchor.constraint(equalTo: currentBalanceLabel.bottomAnchor, constant: 27),
            accountBalance.leadingAnchor.constraint(equalTo: currentBalanceLabel.leadingAnchor),
            accountBalance.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -175),
            accountBalance.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15)
        ])
    }
    
    func customizeAccountStyle() {
        self.layer.borderWidth = 0

        self.currentBalanceLabel.textColor = .sysAccountSecond
        self.currencyTypeLabel.textColor = .sysAccountSecond
        self.accountBalance.textColor = .sysAccountSecond
    }
    
    func setupGradientBackground(color1: UIColor, color2: UIColor, color3: UIColor) {
        self.backgroundGradientLayer = CAGradientLayer()
        backgroundGradientLayer.colors = [color1.cgColor,
                                          color2.cgColor,
                                          color3.cgColor]
        self.layer.insertSublayer(backgroundGradientLayer, at: 0)
    }
}
