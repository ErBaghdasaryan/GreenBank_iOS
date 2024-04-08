//
//  AccountCell.swift
//  GreenBank.UIComponents
//
//  Created by Er Baghdasaryan on 20.03.24.
//

import UIKit

public class AccountCell: UITableViewCell {
    
    public var accountTypeLabel = UILabel(text: "",
                                   textColor: .sysBlack,
                                   font: UIFont.systemFont(ofSize: 16))
    public var accountNumberLabel = UILabel(text: "",
                                     textColor: .lightGray,
                                     font: UIFont.systemFont(ofSize: 13))
    public var moneyCountLabel = UILabel(text: "",
                                  textColor: .black,
                                  font: UIFont.systemFont(ofSize: 16))
    private let cardImage = UIImageView(image: UIImage(named: "master_logo".localized))
    private let line = PopupView()
    
    public static let identifier = "AccountView"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupCellImage()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
        setupCellImage()
    }
    
    public func setupViews() {
        
        accountTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        accountNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        moneyCountLabel.translatesAutoresizingMaskIntoConstraints = false
        cardImage.translatesAutoresizingMaskIntoConstraints = false
        line.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(accountTypeLabel)
        self.addSubview(accountNumberLabel)
        self.addSubview(moneyCountLabel)
        self.addSubview(cardImage)
        self.addSubview(line)
        
        self.frame.size.height = 70
        self.moneyCountLabel.textAlignment = .right
        line.backgroundColor = .sysGradientFirst
        
        NSLayoutConstraint.activate([
            cardImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            cardImage.heightAnchor.constraint(equalToConstant: 24),
            cardImage.widthAnchor.constraint(equalToConstant: 24),
            cardImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 17.63)
        ])
        
        NSLayoutConstraint.activate([
            accountTypeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            accountTypeLabel.widthAnchor.constraint(equalToConstant: 147),
            accountTypeLabel.heightAnchor.constraint(equalToConstant: 21),
            accountTypeLabel.leadingAnchor.constraint(equalTo: cardImage.trailingAnchor, constant: 14.32)
        ])
        
        NSLayoutConstraint.activate([
            accountNumberLabel.topAnchor.constraint(equalTo: accountTypeLabel.bottomAnchor, constant: 5),
            accountNumberLabel.widthAnchor.constraint(equalToConstant: 158),
            accountNumberLabel.heightAnchor.constraint(equalToConstant: 20),
            accountNumberLabel.leadingAnchor.constraint(equalTo: cardImage.trailingAnchor, constant: 14.32)
        ])
        
        NSLayoutConstraint.activate([
            moneyCountLabel.widthAnchor.constraint(equalToConstant: 100),
            moneyCountLabel.heightAnchor.constraint(equalToConstant: 20),
            moneyCountLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            moneyCountLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([
            line.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            line.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            line.heightAnchor.constraint(equalToConstant: 1),
            line.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    public func setupCellImage() {
        self.cardImage.image = UIImage(named: "account_logo".localized)
    }
}
