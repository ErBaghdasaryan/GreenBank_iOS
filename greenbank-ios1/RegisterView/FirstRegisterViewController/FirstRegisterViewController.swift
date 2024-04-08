//
//  RegisterViewController.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 17.01.24.
//

import UIKit
import GreenBank_UIComponents
import GreenBank_ViewModel

final class FirstRegisterViewController: BaseViewController<RegisterViewModel> {
    
    var letsRegisterLabel = UILabel(text: "first_page_firstLabel".localized,
                                    textColor: UIColor.sysBlack,
                                    font: UIFont.SFProBold(size: 24))
    
    var startRightNowLabel = UILabel(text: "first_page_secondLabel".localized,
                                     textColor: UIColor.sysGray,
                                     font: UIFont.SFProMedium(size: 12))
    private var backButton =  UIButton()
    
    var registerView = FirstRegistrationView()
    
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
        registerView.nameTF.textField.delegate = self
        registerView.lastNameTF.textField.delegate = self
        registerView.datePicker.datePickerViewDay.selectedDayText.delegate = self
        registerView.datePicker.datePickerViewYear.selectedYearText.delegate = self
        registerView.datePicker.datePickerViewMonth.selectedMonthText.delegate = self
    }
    
    private func setupUI() {
        letsRegisterLabel.translatesAutoresizingMaskIntoConstraints = false
        startRightNowLabel.translatesAutoresizingMaskIntoConstraints = false
        registerView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(registerView)
        view.addSubview(letsRegisterLabel)
        view.addSubview(startRightNowLabel)
        
        registerView.setupUI()
        registerView.layer.cornerRadius = 40
        registerView.backgroundColor = .white
                
        NSLayoutConstraint.activate([
            letsRegisterLabel.widthAnchor.constraint(equalToConstant: 240),
            letsRegisterLabel.heightAnchor.constraint(equalToConstant: 29),
            letsRegisterLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 37),
            letsRegisterLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 93)
        ])
        
        NSLayoutConstraint.activate([
            startRightNowLabel.widthAnchor.constraint(equalToConstant: 132),
            startRightNowLabel.heightAnchor.constraint(equalToConstant: 14),
            startRightNowLabel.leadingAnchor.constraint(equalTo: letsRegisterLabel.leadingAnchor),
            startRightNowLabel.topAnchor.constraint(equalTo: letsRegisterLabel.bottomAnchor, constant: 3)
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
        
        backButton = UIButton(type: .system)
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
        
        let backAction = UIAction { _ in
            self.dismiss(animated: true)
        }
        
        let continueAction = UIAction { _ in
            let nextVC = SecondRegisterViewController()
            guard let viewModel = self.viewModel else { return }
            
            if viewModel.validator.isValidFirstName(firstName: self.registerView.nameTF.textField.text!) &&
                viewModel.validator.isValidLastName(lastName: self.registerView.lastNameTF.textField.text!) {
                
                nextVC.userRegistrationInfo.firstName = self.registerView.nameTF.textField.text!
                nextVC.userRegistrationInfo.lastName = self.registerView.lastNameTF.textField.text!
                nextVC.userRegistrationInfo.birthday = self.registerView.datePicker.calculateAge()
                self.navigationController?.pushViewController(nextVC, animated: true)
            } else {
                self.registerView.datePicker.datePickerViewDay.selectedDayText.layer.borderColor = UIColor.sysFalseTFBorder.cgColor
                
                self.registerView.datePicker.datePickerViewYear.selectedYearText.layer.borderColor = UIColor.sysFalseTFBorder.cgColor
                
                self.registerView.datePicker.datePickerViewMonth.selectedMonthText.layer.borderColor = UIColor.sysFalseTFBorder.cgColor
            }
            
        }
        
        let loginAction = UIAction { _ in
            let nextVC = LoginViewController()
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
        
        registerView.continueButton.addAction(continueAction, for: .touchUpInside)
        registerView.logInButton.addAction(loginAction, for: .touchUpInside)
        self.backButton.addAction(backAction, for: .touchUpInside)
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
