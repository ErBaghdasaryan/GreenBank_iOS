//
//  ForgotPasswordViewController.swift
//  greenbank-ios1
//
//  Created by Hovo Ohanyan on 19.01.24.
//

import UIKit
import GreenBank_ViewModel

final class ForgotPasswordViewController: BaseViewController<ForgotPasswordViewModel> {
    var forgotPasswordView = ForgotPasswordView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        makeActionForButtons()
        makeDelegates()
    }
    
    private func setupUI() {
        self.viewModel = ForgotPasswordViewModel()
        
        forgotPasswordView.frame = view.frame
        forgotPasswordView.bounds = view.bounds
        
        view.addSubview(forgotPasswordView)
        forgotPasswordView.setupUI()
    }
    
    private func makeActionForButtons() {
        let continueAction = UIAction { _ in
            let nextVC = ForgotPasswordConfirmCodeViewController()
            nextVC.modalPresentationStyle = .fullScreen
            self.show(nextVC, sender: nil)
        }
        
        let loginAction = UIAction { _ in
            let nextVC = LoginViewController()
            nextVC.modalPresentationStyle = .fullScreen
            self.show(nextVC, sender: nil)
        }
        
        self.forgotPasswordView.loginButton.addAction(loginAction, for: .touchUpInside)
        self.forgotPasswordView.continueButton.addAction(continueAction, for: .touchUpInside)
    }
    
    private func makeDelegates() {
        self.forgotPasswordView.emailTextField.textField.delegate = self
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
