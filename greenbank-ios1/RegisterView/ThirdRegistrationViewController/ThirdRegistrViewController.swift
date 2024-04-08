//
//  ThirsRegistrViewController.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 25.01.24.
//

import UIKit
import GreenBank_UIComponents
import GreenBank_ViewModel

final class ThirdRegistrViewController: BaseViewController<VerificationViewModel> {
    var number: String = ""
    
    var loginAccountLabel = UILabel(text: "second_page_firstLabel".localized,
                                    textColor: UIColor.sysBlack,
                                    font: UIFont.SFProBold(size: 24))
    
    var justFewStepsLabel = UILabel(text: "second_page_secondLabel".localized,
                                     textColor: UIColor.sysGray,
                                     font: UIFont.SFProMedium(size: 12))
    var registerView = ThirdRegistrationView()
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.sysMainGreen
        setupUI()
        setupDelegates()
        addCustomBackButton()
        makeButtonAction()
    }
    
    private func setupDelegates() {
        registerView.firstTextField.delegate = self
        registerView.secondTextField.delegate = self
        registerView.thirdTextField.delegate = self
        registerView.fourthTextField.delegate = self
    }
    
    private func setupUI() {
        self.viewModel = VerificationViewModel()
        
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
            let nextVC = FourthRegisterViewController()
            self.viewModel?.sendUserNumber(number: self.number)
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
        
        let loginAction = UIAction { _ in
            let nextVC = LoginViewController()
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
        
        registerView.registerButton.addAction(continueAction, for: .touchUpInside)
        registerView.logInButton.addAction(loginAction, for: .touchUpInside)
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
