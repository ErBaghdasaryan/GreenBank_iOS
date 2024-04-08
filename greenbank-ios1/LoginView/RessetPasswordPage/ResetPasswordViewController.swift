//
//  ResetPasswordViewController.swift
//  greenbank-ios1
//
//  Created by Hovo Ohanyan on 22.01.24.
//

import UIKit
import GreenBank_ViewModel

final class ResetPasswordViewController: BaseViewController<ResetPasswordViewModel> {
    private let resetView = ResetPasswordView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        makeActionForButtons()
        makeDelegates()
    }
    
    private func setupUI() {
        self.viewModel = ResetPasswordViewModel()
        
        resetView.frame = view.frame
        resetView.bounds = view.bounds
        
        resetView.setupUI()
        
        view.addSubview(resetView)
    }
    
    private func makeActionForButtons() {
        let continueAction = UIAction { _ in
            let nextVC = ForgotPasswordLastPageViewController()
            nextVC.modalPresentationStyle = .fullScreen
            self.show(nextVC, sender: nil)
        }
        
        let loginAction = UIAction { _ in
            let nextVC = LoginViewController()
            nextVC.modalPresentationStyle = .fullScreen
            self.show(nextVC, sender: nil)
        }
        
        self.resetView.loginButton.addAction(loginAction, for: .touchUpInside)
        self.resetView.changePasswordButton.addAction(continueAction, for: .touchUpInside)
    }
    
    private func makeDelegates() {
        self.resetView.passwordTextField.textField.delegate = self
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
