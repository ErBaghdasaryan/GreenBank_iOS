//
//  ToAccountViewController.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 12.03.24.
//

import UIKit
import GreenBank_ViewModel
import GreenBank_UIComponents

final class ToAccountViewController: BaseViewController<ToAccountViewModel> {
    
    let toAccountView = ToAccountView()
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
        toAccountView.frame = view.bounds
        toAccountView.setupUI(withData: accountEditModel)
        view.addSubview(toAccountView)
    }
    
    private func setupViewModel() {
        self.viewModel = ToAccountViewModel()
    }
    
    private func setupPicker() {
        self.viewModel?.toAccountmodel.accounts = AppDelegate.shared?.userAccounts
        let accountTypePicker = AccountPicker(imageName: "chevron.down", placeholder: "cardType_placeholder".localized, tableViewHeight: 112,
                                              currencyData: (viewModel?.toAccountmodel.accounts)!)
        toAccountView.chooseAccountTypeTF.setupUI(withText: "accountType_label".localized, typePicker: accountTypePicker)
    }
    
    private func setupDelegates() {
        toAccountView.amountTextField.textField.delegate = self
        toAccountView.creditAccountTextField.textField.delegate = self
        toAccountView.messageTextField.textField.delegate = self
    }
    
    private func makeButtonActions() {
        let backAction = UIAction { _ in
            self.dismiss(animated: true)
        }
        let continueAction = UIAction { _ in
            guard let fromCard = self.toAccountView.chooseAccountTypeTF.typePicker.selectedTypeText.text else { return }
            guard let toCard = self.toAccountView.creditAccountTextField.textField.text else { return }
            guard let amount = Int(self.toAccountView.amountTextField.textField.text!) else { return }
            guard let message = self.toAccountView.messageTextField.textField.text else { return }
            guard let viewmodel = self.viewModel else { return }
            let appDelegate = AppDelegate.shared
            guard let accessToken = appDelegate?.userRegisterInformation?.accessToken else { return }
            let transactionType = "ACCOUNT"
            
            self.toAccountView.continueButton.setTitle("", for: .normal)
            self.toAccountView.activityIndicartor.startAnimating()
            
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
                    self.toAccountView.activityIndicartor.stopAnimating()
                    self.toAccountView.continueButton.setTitle("continue_title".localized, for: .normal)
                }
            }
        }
        self.toAccountView.navigationBar.backButton.addAction(backAction, for: .touchUpInside)
        self.toAccountView.continueButton.addAction(continueAction, for: .touchUpInside)
    }
}
