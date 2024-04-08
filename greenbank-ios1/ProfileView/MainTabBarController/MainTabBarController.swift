//
//  FirstTimeLoggedInProfile.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 31.01.24.
//

import UIKit
import GreenBank_UIComponents

final class MainTabBarController: UIViewController {
    
    let tabBarView = TabBarView()
    let containerView = UIView()
    let shadowView = UIView()
    
    lazy var homeViewController = HomeViewController()
    lazy var transactionViewController = TransactionViewController()
    lazy var paymentViewController = PaymentViewController()
    lazy var accountViewController = ProfileViewController()
    
    var viewControllers: [UIViewController] = []
    
    var previousSelectedButtonIndex: Int?
    private var isFirstTimeTabTapped = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupViewControllers()
    }
    
    private func setupUI() {
        
        tabBarView.homeButton.iconImageButton.addTarget(self,
                                                        action: #selector(tabButtonTapped),
                                                        for: .touchUpInside)
        tabBarView.transactionButton.iconImageButton.addTarget(self,
                                                               action: #selector(tabButtonTapped),
                                                               for: .touchUpInside)
        tabBarView.paymentButton.iconImageButton.addTarget(self,
                                                          action: #selector(tabButtonTapped),
                                                          for: .touchUpInside)
        tabBarView.accountButton.iconImageButton.addTarget(self,
                                                           action: #selector(tabButtonTapped),
                                                           for: .touchUpInside)
        
//        containerView.backgroundColor = .orange
        containerView.frame = view.bounds
        tabBarView.setupUI()

        shadowView.shadow()
        shadowView.backgroundColor = .white
        shadowView.layer.cornerRadius = 33.3
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        tabBarView.translatesAutoresizingMaskIntoConstraints = false
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        view.addSubview(shadowView)
        shadowView.addSubview(tabBarView)
        
        NSLayoutConstraint.activate([
            shadowView.heightAnchor.constraint(equalToConstant: 66.74),
            shadowView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 13),
            shadowView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -13),
            shadowView.bottomAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 11)
        ])
        
        NSLayoutConstraint.activate([
            tabBarView.heightAnchor.constraint(equalTo: shadowView.heightAnchor),
            tabBarView.leadingAnchor.constraint(equalTo: shadowView.leadingAnchor),
            tabBarView.trailingAnchor.constraint(equalTo: shadowView.trailingAnchor),
            tabBarView.bottomAnchor.constraint(greaterThanOrEqualTo: shadowView.bottomAnchor)
        ])
    }
    
    private func setupViewControllers() {
        viewControllers = [homeViewController, transactionViewController, paymentViewController, accountViewController]
        containerView.addSubview(viewControllers.first!.view)
        setupUserInfoForProfile()
        changeSelecteedButtonColor(index: 0)
    }
    
    @objc private func tabButtonTapped(_ sender: UIButton) {
        
        if self.isFirstTimeTabTapped {
            resetSelectedButtonColor(index: 0)
            isFirstTimeTabTapped = false
        }
        
        if let previousIndex = previousSelectedButtonIndex  {
            resetSelectedButtonColor(index: previousIndex)
        }
        
        if let index = [tabBarView.homeButton.iconImageButton,
                        tabBarView.transactionButton.iconImageButton,
                        tabBarView.paymentButton.iconImageButton,
                        tabBarView.accountButton.iconImageButton].firstIndex(of: sender) {
            showViewController(index: index)
            changeSelecteedButtonColor(index: index)
            self.previousSelectedButtonIndex = index
        }
    }
    
    public func showViewController(index: Int) {
        let currentViewController = children.first
        currentViewController?.removeFromParent()
        currentViewController?.view.removeFromSuperview()
        let selectedViewController = viewControllers[index]
        addChild(selectedViewController)
        containerView.addSubview(selectedViewController.view)
        selectedViewController.didMove(toParent: self)
    }
    
    private func changeSelecteedButtonColor(index: Int) {
        switch index {
        case 0:
            self.tabBarView.homeButton.iconImageButton.setImage(UIImage(named: "tabBar_selectedHome_icon".localized), for: .normal)
        case 1:
            self.tabBarView.transactionButton.iconImageButton.setImage(UIImage(named: "tabBar_selectedTransaction_icon".localized), for: .normal)
        case 2:
            self.tabBarView.paymentButton.iconImageButton.setImage(UIImage(named: "tabBar_selectedPayment_icon".localized), for: .normal)
        case 3:
            self.tabBarView.accountButton.iconImageButton.setImage(UIImage(named: "tabBar_selectedProfile_icon".localized), for: .normal)
        default:
            print("A")
        }
    }
    
    private func resetSelectedButtonColor(index: Int) {
        switch index {
        case 0:
            self.tabBarView.homeButton.iconImageButton.setImage(UIImage(named: "tabBar_home_icon".localized), for: .normal)
        case 1:
            self.tabBarView.transactionButton.iconImageButton.setImage(UIImage(named: "tabBar_transaction_icon".localized), for: .normal)
        case 2:
            self.tabBarView.paymentButton.iconImageButton.setImage(UIImage(named: "tabBar_payment_icon".localized), for: .normal)
        case 3:
            self.tabBarView.accountButton.iconImageButton.setImage(UIImage(named: "tabBar_profile_icon".localized), for: .normal)
        default:
            print("A")
        }
    }
    
    public func setupUserInfoForProfile() {
        guard let userInfo = AppDelegate.shared?.userRegisterInformation?.userDto else { return }
        
        accountViewController.profileView.setupProfileUser(userFirstName: userInfo.firstName,
                                                           userLastName: userInfo.lastName,
                                                           userMobile: userInfo.phone,
                                                           userEmail: userInfo.email)
        paymentViewController.phoneViewController.toPhoneView.updateUI(name: userInfo.firstName,
                                                                       lastName: userInfo.lastName)
    }
}
