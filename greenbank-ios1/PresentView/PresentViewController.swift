//
//  PresentViewController.swift
//  greenbank-ios1
//
//  Created by Hovo Ohanyan on 15.01.24.
//

import UIKit

final class PresentViewController: UIViewController {
    private let presentView = PresentView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        makeButtonsAction()
        presentView.makeAnimation()
    }
    
    private func setupUI() {
        presentView.frame = view.frame
        presentView.bounds = view.bounds
        
        presentView.setupUI()
        view.addSubview(presentView)
    }
    
    private func makeButtonsAction() {
        let loginAction = UIAction { action in
            let nextVC = LoginViewController()
            nextVC.modalPresentationStyle = .fullScreen
            self.present(nextVC, animated: true)
        }
        
        let getStartAction = UIAction { _ in
            let nextVC = FirstRegisterViewController()
            let navVC = UINavigationController(rootViewController: nextVC)
            navVC.modalPresentationStyle = .fullScreen
            self.show(navVC, sender: nil)
        }
        
        self.presentView.getStartedButton.addAction(getStartAction, for: .touchUpInside)
        self.presentView.logInButton.addAction(loginAction, for: .touchUpInside)
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
