//
//  PaymentSuccesViewController.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 01.04.24.
//

import UIKit

final class PaymentSuccesViewController: UIViewController {
    
    public var paymentSuccessView = PaymentSuccesView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        makeButtonActions()
    }
    
    private func setupUI() {
        paymentSuccessView.frame = view.bounds
        paymentSuccessView.setupUI()
        view.addSubview(paymentSuccessView)
    }
    
    private func makeButtonActions() {
        let homeAction = UIAction { _ in
            let nextVC = MainTabBarController()
            nextVC.modalPresentationStyle = .fullScreen
            self.present(nextVC, animated: true)
        }
        
        self.paymentSuccessView.homeButton.addAction(homeAction, for: .touchUpInside)
    }
}
