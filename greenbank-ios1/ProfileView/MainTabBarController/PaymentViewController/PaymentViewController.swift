//
//  SearchViewController.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 31.01.24.
//

import UIKit

final class PaymentViewController: UIViewController {
    
    let paymentView = PaymentView()
    let phoneViewController = ToPhoneViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        makeButtonAction()
    }
    
    private func setupUI() {
        paymentView.frame = view.bounds
        paymentView.setupUI()
        view.addSubview(paymentView)
    }
    
    private func makeButtonAction() {
        let backAction = UIAction { _ in
            if let presentingViewController = self.presentingViewController as? MainTabBarController {
                presentingViewController.showViewController(index: 0)
            }
        }
        
        let toCardAction = UIAction { _ in
            let nextVC = ToCardViewController()
            nextVC.modalPresentationStyle = .fullScreen
            self.present(nextVC, animated: true)
        }
        
        let toAccountAction = UIAction { _ in
            let nextVC = ToAccountViewController()
            nextVC.modalPresentationStyle = .fullScreen
            self.present(nextVC, animated: true)
        }
        
        let toPhoneAction = UIAction { _ in
            self.phoneViewController.modalPresentationStyle = .fullScreen
            self.present(self.phoneViewController, animated: true)
        }
        
        self.paymentView.navigationBar.backButton.addAction(backAction, for: .touchUpInside)
        self.paymentView.selectFormView.cardForm.imageForm.addAction(toCardAction, for: .touchUpInside)
        self.paymentView.selectFormView.accountForm.imageForm.addAction(toAccountAction, for: .touchUpInside)
        self.paymentView.selectFormView.phoneForm.imageForm.addAction(toPhoneAction, for: .touchUpInside)
    }
}
