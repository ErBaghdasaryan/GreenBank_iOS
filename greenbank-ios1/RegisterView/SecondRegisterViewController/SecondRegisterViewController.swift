//
//  SecondRegisterViewController.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 24.01.24.
//

import UIKit
import GreenBank_UIComponents
import GreenBank_ViewModel

final class SecondRegisterViewController: BaseViewController<RegisterViewModel> {
    
    var loginAccountLabel = UILabel(text: "second_page_firstLabel".localized,
                                    textColor: UIColor.sysBlack,
                                    font: UIFont.SFProBold(size: 24))
    
    var justFewStepsLabel = UILabel(text: "second_page_secondLabel".localized,
                                     textColor: UIColor.sysGray,
                                     font: UIFont.SFProMedium(size: 12))
    
    public var passwordText: String?
    
    var registerView = SecondRegistrationView()
    
    var userRegistrationInfo = UserRegistrationInfo()
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.sysMainGreen
        setupUI()
        addCustomBackButton()
        makeButtonAction()
        setupViewModel()
        setupDelegates()
    }
    
    private func setupViewModel() {
        self.viewModel = RegisterViewModel()
    }
    
    private func setupDelegates() {
        registerView.emailTF.textField.delegate = self
        registerView.phoneNumberTF.textField.delegate = self
        registerView.passwordTF.textField.delegate = self
        registerView.repeatPasswordTF.textField.delegate = self
    }
    
    private func setupUI() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
        
        self.viewModel = RegisterViewModel()
        self.navigationItem.hidesBackButton = true
        loginAccountLabel.translatesAutoresizingMaskIntoConstraints = false
        justFewStepsLabel.translatesAutoresizingMaskIntoConstraints = false
        registerView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(registerView)
        view.addSubview(loginAccountLabel)
        view.addSubview(justFewStepsLabel)
        
        registerView.setupUI()
        registerView.layer.cornerRadius = 40
        registerView.backgroundColor = .white
                
        NSLayoutConstraint.activate([
            loginAccountLabel.widthAnchor.constraint(equalToConstant: 243),
            loginAccountLabel.heightAnchor.constraint(equalToConstant: 29),
            loginAccountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 37),
            loginAccountLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 93)
        ])
        
        NSLayoutConstraint.activate([
            justFewStepsLabel.widthAnchor.constraint(equalToConstant: 185),
            justFewStepsLabel.heightAnchor.constraint(equalToConstant: 14),
            justFewStepsLabel.leadingAnchor.constraint(equalTo: loginAccountLabel.leadingAnchor),
            justFewStepsLabel.topAnchor.constraint(equalTo: loginAccountLabel.bottomAnchor, constant: 3)
        ])
        
        NSLayoutConstraint.activate([
            registerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            registerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            registerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 209),
            registerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)

        ])
    }
    
    private func addCustomBackButton() {
        
        self.navigationItem.hidesBackButton = true
        
        let backButton = UIButton(type: .system)
        backButton.setImage(UIImage(named: "backButton_title".localized), for: .normal)
        backButton.tintColor = .gray
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backButton)

        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            backButton.topAnchor.constraint(equalTo: registerView.topAnchor, constant: 15),
            backButton.widthAnchor.constraint(equalToConstant: 44),
            backButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func makeButtonAction() {
        let continueAction = UIAction { _ in
            let nextVC = ThirdRegistrViewController()
            guard let viewModel = self.viewModel else { return }
            
            if viewModel.validator.emailValidation(email: self.registerView.emailTF.textField.text!) &&
                viewModel.validator.isValidArmenianPhoneNumber(phoneNumber: self.registerView.phoneNumberTF.textField.text!) && viewModel.validator.confirmPasswordValidation(password: self.registerView.passwordTF.textField.text!, confirmPassword: self.registerView.repeatPasswordTF.textField.text!) {
                self.userRegistrationInfo.email = self.registerView.emailTF.textField.text!
                self.userRegistrationInfo.phone = self.registerView.phoneNumberTF.textField.text!
                self.userRegistrationInfo.password = self.registerView.passwordTF.textField.text
                
                Task {
                    self.registerView.activityIndicartor.startAnimating()
                    self.registerView.continueButton.setTitle("", for: .normal)

                    do {
                        try await self.viewModel?.postUser(self.userRegistrationInfo)
                        self.registerView.activityIndicartor.stopAnimating()
                        self.registerView.continueButton.setTitle("button_continue_title".localized, for: .normal)
                        self.navigationController?.pushViewController(nextVC, animated: true)
                    } catch {
                        self.registerView.continueButton.setTitle("button_continue_title".localized, for: .normal)
                        self.registerView.activityIndicartor.stopAnimating()
                    }
                }
            } else {
                
            }
        }
        
        let loginAction = UIAction { _ in
            let nextVC = LoginViewController()
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
        
        registerView.continueButton.addAction(continueAction, for: .touchUpInside)
        registerView.logInButton.addAction(loginAction, for: .touchUpInside)
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            if let activeTextField = findActiveTextField() {
                let textFieldRect = activeTextField.convert(activeTextField.bounds, to: view)
                let offsetY = max(0, textFieldRect.maxY - (view.bounds.height - keyboardSize.height))
                UIView.animate(withDuration: 0.3) {
                    self.view.frame.origin.y = -offsetY
                }
            }
        }
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        UIView.animate(withDuration: 0.3) {
            self.view.frame.origin.y = 0
        }
    }
    
    private func findActiveTextField() -> UITextField? {
        if registerView.emailTF.textField.isFirstResponder {
            return registerView.emailTF.textField
        } else if registerView.phoneNumberTF.textField.isFirstResponder {
            return registerView.phoneNumberTF.textField
        } else if registerView.passwordTF.textField.isFirstResponder {
            return registerView.passwordTF.textField
        } else if registerView.repeatPasswordTF.textField.isFirstResponder {
            return registerView.repeatPasswordTF.textField
        }
        return nil
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
