//
//  SearchView.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 31.01.24.
//

import UIKit
import GreenBank_UIComponents

class PaymentView: UIView {
    
    public var navigationBar = NavigationBar(titleText: "payments_label".localized)
    public var selectFormView = SelectFormView()
    public var shadowView = UIView()
    public var noInfoView = NoInfoView()
    
    public func setupUI() {
        backgroundColor = .sysMainWhite
        
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        selectFormView.translatesAutoresizingMaskIntoConstraints = false
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        noInfoView.translatesAutoresizingMaskIntoConstraints = false
        
        navigationBar.setupConstraints()
        selectFormView.setupUI()
        shadowView.shadow()
        shadowView.backgroundColor = .white
        
        shadowView.layer.cornerRadius = 20
        
        navigationBar.greenView.isHidden = true
        navigationBar.backButton.isHidden = true
        
        addSubview(navigationBar)
        addSubview(selectFormView)
        addSubview(shadowView)
        shadowView.addSubview(noInfoView)
        
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: self.topAnchor, constant: 65),
            navigationBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            navigationBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            navigationBar.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            selectFormView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 20),
            selectFormView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            selectFormView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40.88),
            selectFormView.heightAnchor.constraint(equalToConstant: 336)
        ])
        
        NSLayoutConstraint.activate([
            shadowView.topAnchor.constraint(equalTo: selectFormView.bottomAnchor, constant: 43.41),
            shadowView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            shadowView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -17),
            shadowView.heightAnchor.constraint(equalToConstant: 167)
        ])
        
        NSLayoutConstraint.activate([
            noInfoView.topAnchor.constraint(equalTo: selectFormView.bottomAnchor, constant: 43.41),
            noInfoView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            noInfoView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -17),
            noInfoView.heightAnchor.constraint(equalToConstant: 167)
        ])
    }
}
