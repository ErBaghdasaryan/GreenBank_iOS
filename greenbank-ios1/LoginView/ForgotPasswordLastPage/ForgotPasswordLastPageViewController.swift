//
//  ForgotPasswordLastPageViewController.swift
//  greenbank-ios1
//
//  Created by Hovo Ohanyan on 22.01.24.
//

import UIKit

final class ForgotPasswordLastPageViewController: UIViewController {
    private let forgotPasswordLastPageView = ForgotPasswordLastPageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        makeActionForButtons()
    }
    
    private func setupUI() {
        forgotPasswordLastPageView.frame = view.frame
        forgotPasswordLastPageView.bounds = view.bounds
        
        forgotPasswordLastPageView.setupUI()
        view.addSubview(forgotPasswordLastPageView)
    }
    
    private func makeActionForButtons() {
        let continueAction = UIAction { _ in
            let nextVC = LoginViewController()
            nextVC.modalPresentationStyle = .fullScreen
            self.show(nextVC, sender: nil)
        }
        
        self.forgotPasswordLastPageView.loginButton.addAction(continueAction, for: .touchUpInside)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
