//
//  TransactionView.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 31.01.24.
//

import UIKit
import GreenBank_UIComponents

class TransactionView: UIView {

    public var navigationBar = NavigationBar(titleText: "transaction_Label".localized)
    public var shadowView = UIView()
    public var noInfoView = NoInfoView()
    
    public func setupUI() {
        
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        noInfoView.translatesAutoresizingMaskIntoConstraints = false
        
        self.backgroundColor = .sysMainWhite
        
        navigationBar.greenView.isHidden = true
        navigationBar.backButton.isHidden = true
        navigationBar.setupConstraints()
        
        shadowView.shadow()
        shadowView.backgroundColor = .white
        shadowView.layer.cornerRadius = 20
        
        addSubview(navigationBar)
        addSubview(shadowView)
        shadowView.addSubview(noInfoView)
        
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: self.topAnchor, constant: 65),
            navigationBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            navigationBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            navigationBar.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            shadowView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 83.41),
            shadowView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            shadowView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -17),
            shadowView.heightAnchor.constraint(equalToConstant: 167)
        ])
        
        NSLayoutConstraint.activate([
            noInfoView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 83.41),
            noInfoView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            noInfoView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -17),
            noInfoView.heightAnchor.constraint(equalToConstant: 167)
        ])
    }
}
