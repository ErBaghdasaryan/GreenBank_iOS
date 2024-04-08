//
//  CardView.swift
//  greenbank-ios1
//
//  Created by Hovo Ohanyan on 06.02.24.
//

import UIKit
import GreenBank_UIComponents
import GreenBank_ViewModel

final class CardView: UICollectionViewCell {
    
    public let firstHalfView = UIView()
    public let secondHalfView = UIView()

    private let cardTypeLabel = UILabel(text: "Visa",
                                        textColor: .white,
                                        font: UIFont.SFProBold(size: 11))
    private let cardWifiImage = UIImageView(image: UIImage(named: "wifi_image".localized))
    private let cardChipImage = UIImageView(image: UIImage(named: "chip_image".localized))
    
    private let editButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "edit")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .sysMainWhite
        return button
    }()
    
    private let cardNumber = UILabel(text: "** 2130", textColor: .sysMainWhite, font: UIFont.SFProBold(size: 12))
    private var currencyType: String = "$"
    private lazy var cardBalance: UILabel = {
        let label = UILabel()
        label.text = "\(currencyType) 00.000"
        label.textColor = .sysMainWhite
        label.font = UIFont.SFProBold(size: 19)
        return label
    }()

    private var cardTypeName = UILabel(text: "", textColor: .sysMainWhite, font: UIFont.SFProBold(size: 12))
    
    static let identifier = "CardView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.cornerRadius = 10
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 10
        
        
        
        firstHalfView.translatesAutoresizingMaskIntoConstraints = false
        secondHalfView.translatesAutoresizingMaskIntoConstraints = false
        cardTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        cardTypeName.translatesAutoresizingMaskIntoConstraints = false
        cardWifiImage.translatesAutoresizingMaskIntoConstraints = false
        cardNumber.translatesAutoresizingMaskIntoConstraints = false
        cardBalance.translatesAutoresizingMaskIntoConstraints = false
        cardChipImage.translatesAutoresizingMaskIntoConstraints = false
        editButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(firstHalfView)
        self.addSubview(secondHalfView)
        self.addSubview(cardTypeLabel)
        self.addSubview(cardTypeName)
        self.addSubview(cardWifiImage)
        self.addSubview(editButton)
        self.addSubview(cardNumber)
        self.addSubview(cardBalance)
        self.addSubview(cardChipImage)
        
        makeAutoLayout()
    }
    
    func makeAutoLayout() {
        NSLayoutConstraint.activate([
            firstHalfView.topAnchor.constraint(equalTo: self.topAnchor),
            firstHalfView.leftAnchor.constraint(equalTo: self.leftAnchor),
            firstHalfView.rightAnchor.constraint(equalTo: self.rightAnchor),
            firstHalfView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            secondHalfView.topAnchor.constraint(equalTo: self.topAnchor),
            secondHalfView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 202.81),
            secondHalfView.rightAnchor.constraint(equalTo: self.rightAnchor),
            secondHalfView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            cardTypeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 21),
            cardTypeLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 17),
            cardTypeLabel.widthAnchor.constraint(equalToConstant: 66),
            cardTypeLabel.heightAnchor.constraint(equalToConstant: 14)
        ])
        
        NSLayoutConstraint.activate([
            cardTypeName.topAnchor.constraint(equalTo: self.topAnchor, constant: 20.85),
            cardTypeName.leftAnchor.constraint(equalTo: cardTypeLabel.rightAnchor, constant: 3),
            cardTypeName.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -123.98),
            cardTypeName.centerYAnchor.constraint(equalTo: cardTypeLabel.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            cardWifiImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 18.95),
            cardWifiImage.leftAnchor.constraint(equalTo: cardTypeLabel.rightAnchor, constant: 7),
            cardWifiImage.centerYAnchor.constraint(equalTo: cardTypeLabel.centerYAnchor),
            cardWifiImage.widthAnchor.constraint(equalToConstant: 17.1)
        ])
        
        NSLayoutConstraint.activate([
            editButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 20.85),
            editButton.leftAnchor.constraint(equalTo: secondHalfView.leftAnchor, constant: 17.06),
            editButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15.48),
            editButton.centerYAnchor.constraint(equalTo: cardTypeLabel.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            cardNumber.topAnchor.constraint(equalTo: self.topAnchor, constant: 91),
            cardNumber.leftAnchor.constraint(equalTo: cardTypeLabel.leftAnchor),
            cardNumber.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -186),
            cardNumber.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -49.49)
        ])
        
        NSLayoutConstraint.activate([
            cardBalance.topAnchor.constraint(equalTo: cardNumber.bottomAnchor, constant: 8),
            cardBalance.leftAnchor.constraint(equalTo: cardNumber.leftAnchor),
            cardBalance.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -144),
            cardBalance.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -18.69)
        ])
        
        NSLayoutConstraint.activate([
            cardChipImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 114.67),
            cardChipImage.leftAnchor.constraint(equalTo: secondHalfView.leftAnchor, constant: 10.42),
            cardChipImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -9.48),
            cardChipImage.centerYAnchor.constraint(equalTo: cardBalance.centerYAnchor)
        ])
    }
    
    func setupComponents(card: Card) {
//        switch card.cardType { //MARK: To do
//        case "VISA":
//            cardTypeName.text = ""
//            cardTypeLabel.text = "Visa"
//        case "MASTERCARD":
//            cardTypeName.text = "Mastercard"
//            cardTypeLabel.text = "Master"
//        default:
//            break
//        }
        
        cardNumber.text = maskBankCardNumber(card.cardNumber)

        editColors(firstHalfColor: (UIColor(hex: card.colour?.firstHex ?? "#CFE2FE") ??
                                    UIColor(hex: "#CFE2FE"))!,
                   secondHalfColor: UIColor(hex: card.colour?.secondHex ?? "#7797C6") ??
        UIColor(hex: "#7797C6")!)
        self.setupUI()
    }
    
    func editColors(firstHalfColor: UIColor, secondHalfColor: UIColor) {
        firstHalfView.backgroundColor = firstHalfColor
        secondHalfView.backgroundColor = secondHalfColor
    }
    
    private func maskBankCardNumber(_ cardNumber: String) -> String {
        guard cardNumber.count >= 4 else {
            return cardNumber
        }
        
        let lastFourDigits = String(cardNumber.suffix(4))
        
        let maskedString = String(repeating: "*", count: 2) + " " + lastFourDigits
        
        return maskedString
    }
    
    public func changeCardType(cardType: String? = nil, currencyType: String? = nil) {
        if let cardType = cardType {
            switch cardType {
            case "Visa":
                cardTypeLabel.text = "Visa"
            case "Master":
                cardTypeLabel.text = "Mastercard"
            default:
                fatalError()
            }
        }
        if let currencyType = currencyType{
            switch currencyType {
            case "USD":
                self.currencyType = "$"
            case "AMD":
                self.currencyType = "֏"
            case "EUR":
                self.currencyType = "€"
            default:
                fatalError()
            }
        }
    }
}
