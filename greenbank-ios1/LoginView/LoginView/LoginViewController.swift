//
//  ViewController.swift
//  greenbank-ios1
//
//  Created by Hovo Ohanyan on 09.01.24.
//

import UIKit
import GreenBank_ViewModel
import GreenBank_UIComponents

final class LoginViewController: BaseViewController<LoginViewModel> {
    let loginView = LoginView()
    private let backgroundView = BackgroundView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupViewModel()
        makeActionForButtons()
        setupDelegates()
    }
    
    func makeBackgroundAnimation() {
        UIView.animate(withDuration: 1) {
            self.backgroundView.alpha = 1
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        navigationItem.hidesBackButton = true
        
        loginView.frame = view.frame
        loginView.bounds = view.bounds
        
        backgroundView.frame = view.frame
        backgroundView.bounds = view.bounds
        backgroundView.alpha = 0
        
        backgroundView.setupUI()
        loginView.setupUI()
        view.addSubview(backgroundView)
        view.addSubview(loginView)
        
        self.viewDidLayoutSubviews()
    }
    
    private func setupViewModel() {
        self.viewModel = LoginViewModel()
    }
    
    private func setupDelegates() {
        loginView.emailTextField.textField.delegate = self
        loginView.passwordTextField.textField.delegate = self
    }

    private func makeActionForButtons() {
        let forgotPasswordAction = UIAction { _ in
            let nextVC = ForgotPasswordViewController()
            nextVC.modalPresentationStyle = .fullScreen
            self.show(nextVC, sender: nil)
        }
        
        let loginButtonAction = UIAction { _ in
            let email = self.loginView.emailTextField.textField.text!
            let password = self.loginView.passwordTextField.textField.text!
            guard let viewModel = self.viewModel else { return }
            
            if viewModel.validator.validationForUserRegistrationData(email: email,
                                                                     password: password,
                                                                     confirmPassword: password) {
                self.loginView.activityIndicartor.startAnimating()
                self.loginView.loginButton.setTitle("", for: .normal)
                
                Task {
                    do {
                        AppDelegate.shared?.userRegisterInformation = try await viewModel.getUser(withEmail: email, withPassword: password)?.value
                        self.loginView.activityIndicartor.stopAnimating()
                        let nextVC = MainTabBarController()
                        nextVC.modalPresentationStyle = .fullScreen
                        self.present(nextVC, animated: true)
                    } catch {
                        self.loginView.emailTextField.textField.layer.borderColor = UIColor.sysFalseTFBorder.cgColor
                        self.loginView.emailTextField.textField.rightView?.tintColor = .sysFalseTFBorder
                        self.loginView.passwordTextField.textField.layer.borderColor = UIColor.sysFalseTFBorder.cgColor
                        self.loginView.passwordTextField.textField.rightView?.tintColor = .sysFalseTFBorder
                        self.loginView.messageLabel.text = "login_page_message".localized
                        self.loginView.activityIndicartor.stopAnimating()
                        self.loginView.loginButton.setTitle("button_login_title".localized, for: .normal)
                    }
                }
            }
        }
        
        let continueAction = UIAction { _ in
            let nextVC = FirstRegisterViewController()
            let navVC = UINavigationController(rootViewController: nextVC)
            navVC.modalPresentationStyle = .fullScreen
            self.present(navVC, animated: true)
        }
        
        self.loginView.loginButton.addAction(loginButtonAction, for: .touchUpInside)
        self.loginView.forgotButton.addAction(forgotPasswordAction, for: .touchUpInside)
        self.loginView.signUpButton.addAction(continueAction, for: .touchUpInside)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
