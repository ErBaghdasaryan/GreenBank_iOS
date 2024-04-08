//
//  ForgotPasswordConfirmCodeViewController.swift
//  greenbank-ios1
//
//  Created by Hovo Ohanyan on 22.01.24.
//

import UIKit
import GreenBank_ViewModel

final class ForgotPasswordConfirmCodeViewController: BaseViewController<ForgotPasswordViewModel> {
    let forgotPasswordView = ForgotPasswordConfirmCodeView()
    var number: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupDelegates()
        makeActionForButtons()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    private func setupUI() {
        forgotPasswordView.frame = view.frame
        forgotPasswordView.bounds = view.bounds
        
        forgotPasswordView.setupUI()
        
        view.addSubview(forgotPasswordView)
    }
    
    private func setupDelegates() {
        forgotPasswordView.firstTextField.delegate = self
        forgotPasswordView.secondTextField.delegate = self
        forgotPasswordView.thirdTextField.delegate = self
        forgotPasswordView.fourthTextField.delegate = self
    }
    
    private func makeActionForButtons() {
        let continueAction = UIAction { _ in
            let nextVC = ResetPasswordViewController()
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
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
