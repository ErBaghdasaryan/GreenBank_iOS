//
//  TabBarView.swift
//  GreenBank.UIComponents
//
//  Created by Er Baghdasaryan on 31.01.24.
//

import UIKit

public class TabBarView: UIView {
    
    public lazy var homeButton = TabBarItemView()
    public lazy var transactionButton = TabBarItemView()
    public lazy var paymentButton = TabBarItemView()
    public lazy var accountButton = TabBarItemView()
    
    public var viewControllers: [UIViewController] = []
    
    public private(set) var selectedIndex: Int = 0
    
    public lazy var barStackView = UIStackView(arrangedSubviews: [homeButton, transactionButton, paymentButton, accountButton],
                                               axis: .horizontal, spacing: 1)
    
    public func setupUI() {
        barStackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.backgroundColor = .white
        
        layer.cornerRadius = 33.3
        layer.masksToBounds = true
        
        homeButton.update(image: UIImage(named: "tabBar_home_icon".localized))
        transactionButton.update(image: UIImage(named: "tabBar_transaction_icon".localized))
        paymentButton.update(image: UIImage(named: "tabBar_payment_icon".localized))
        accountButton.update(image: UIImage(named: "tabBar_profile_icon".localized))
        
        self.addSubview(barStackView)
        
        NSLayoutConstraint.activate([
            barStackView.topAnchor.constraint(equalTo: self.topAnchor),
            barStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            barStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            barStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    public func updateSelectedIndex(index: Int) {
        self.selectedIndex = index
    }
}
