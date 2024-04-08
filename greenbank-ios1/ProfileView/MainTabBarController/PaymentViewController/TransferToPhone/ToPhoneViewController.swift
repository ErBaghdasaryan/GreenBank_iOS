//
//  ToPhoneViewController.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 03.04.24.
//

import Contacts
import ContactsUI
import UIKit
import GreenBank_ViewModel
import GreenBank_UIComponents

final class ToPhoneViewController: BaseViewController<ToAccountViewModel> {
    
    let toPhoneView = ToPhoneView()
    private let accountEditModel = AccountEditModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupViewModel()
        setupDelegates()
        setupPicker()
        makeButtonActions()
    }
    
    private func setupUI() {
        toPhoneView.frame = view.bounds
        toPhoneView.setupUI(withData: accountEditModel)
        view.addSubview(toPhoneView)
    }
    
    private func setupViewModel() {
        self.viewModel = ToAccountViewModel()
    }
    
    private func setupPicker() {
        self.viewModel?.toAccountmodel.accounts = AppDelegate.shared?.userAccounts
        let accountTypePicker = AccountPicker(imageName: "chevron.down", placeholder: "cardType_placeholder".localized, tableViewHeight: 112,
                                              currencyData: (viewModel?.toAccountmodel.accounts)!)
        toPhoneView.chooseAccountTypeTF.setupUI(withText: "accountType_label".localized, typePicker: accountTypePicker)
    }
    
    private func setupDelegates() {
        toPhoneView.amountTextField.textField.delegate = self
        toPhoneView.creditPhoneTextField.textField.delegate = self
        toPhoneView.messageTextField.textField.delegate = self
    }
    
    private func makeButtonActions() {
        let backAction = UIAction { _ in
            self.dismiss(animated: true)
        }
        let continueAction = UIAction { _ in
            guard let fromCard = self.toPhoneView.chooseAccountTypeTF.typePicker.selectedTypeText.text else { return }
            guard let toCard = self.toPhoneView.creditPhoneTextField.textField.text else { return }
            guard let amount = Int(self.toPhoneView.amountTextField.textField.text!) else { return }
            guard let message = self.toPhoneView.messageTextField.textField.text else { return }
            let appDelegate = AppDelegate.shared
            guard let accessToken = appDelegate?.userRegisterInformation?.accessToken else { return }
            let transactionType = "ACCOUNT"
            
            self.toPhoneView.continueButton.setTitle("", for: .normal)
            self.toPhoneView.activityIndicartor.startAnimating()
            
            Task {
                do {
                    let data = try await self.viewModel?.doTransaction(from: fromCard,
                                                                       to: toCard,
                                                                       amount: amount,
                                                                       description: message,
                                                                       type: transactionType,
                                                                       accessToken: accessToken)
                    
                    let nextVC = PaymentSuccesViewController()
                    nextVC.modalPresentationStyle = .fullScreen
                    self.present(nextVC, animated: true)
                } catch {
                    self.toPhoneView.activityIndicartor.stopAnimating()
                    self.toPhoneView.continueButton.setTitle("continue_title".localized, for: .normal)
                }
            }
        }
        let openContactsAction = UIAction { _ in
            let vc = CNContactPickerViewController()
            vc.delegate = self
            self.present(vc, animated: true)
        }
        
        
        self.toPhoneView.navigationBar.backButton.addAction(backAction, for: .touchUpInside)
        self.toPhoneView.continueButton.addAction(continueAction, for: .touchUpInside)
        self.toPhoneView.openContactButton.addAction(openContactsAction, for: .touchUpInside)
    }
}
