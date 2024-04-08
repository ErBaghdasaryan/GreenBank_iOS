//
//  NoInfoView.swift
//  GreenBank.UIComponents
//
//  Created by Er Baghdasaryan on 11.03.24.
//

import UIKit

public class NoInfoView: UIView {

    private let noInfoLabel = UILabel(text: "noInfo_Header".localized,
                                      textColor: .lightGray,
                                      font: .SFProRegular(size: 14))
    private let makeTransactionLabel = UILabel(text: "makeInfo_Label".localized,
                                               textColor: .black,
                                               font: .SFProSemiBold(size: 18))
    
    public init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        noInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        makeTransactionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(noInfoLabel)
        addSubview(makeTransactionLabel)
        
        noInfoLabel.textAlignment = .center
        
        layer.masksToBounds = true
        layer.cornerRadius = 20
        
        makeTransactionLabel.textAlignment = .center
        makeTransactionLabel.numberOfLines = 2
        
        NSLayoutConstraint.activate([
            noInfoLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            noInfoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 88),
            noInfoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -88),
            noInfoLabel.heightAnchor.constraint(equalToConstant: 17)
        ])
        
        NSLayoutConstraint.activate([
            makeTransactionLabel.topAnchor.constraint(equalTo: noInfoLabel.bottomAnchor, constant: 52),
            makeTransactionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 51),
            makeTransactionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -51),
            makeTransactionLabel.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
