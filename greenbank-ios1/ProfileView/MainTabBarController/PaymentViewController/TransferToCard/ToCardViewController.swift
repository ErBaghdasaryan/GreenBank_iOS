//
//  ToCardViewController.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 11.03.24.
//

import UIKit
import GreenBank_ViewModel

final class ToCardViewController: BaseViewController<ToCardViewModel> {
    let toCardView = ToCardView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
        setupUI()
        setupDelegates()
        makeButtonActions()
    }
    
    private func setupUI() {
        toCardView.frame = view.bounds
        toCardView.setupUI()
        setupPicker()
        view.addSubview(toCardView)
    }
    
    private func setupViewModel() {
        self.viewModel = ToCardViewModel()
    }
    
    private func setupDelegates() {
        toCardView.amountTextField.textField.delegate = self
        toCardView.creditCardTextField.textField.delegate = self
        toCardView.messageTextField.textField.delegate = self
    }
    
    private func setupPicker() {
        self.viewModel?.toCardModel.cards = AppDelegate.shared?.userCards
        let cardTypePicker = CardPicker(imageName: "chevron.down", placeholder: "cardType_placeholder".localized, tableViewHeight: 112,
                                        currencyData: (viewModel?.toCardModel.cards)!)
        toCardView.chooseTypeTF.setupUI(withText: "accountType_label".localized, typePicker: cardTypePicker)
    }
    
    private func makeButtonActions() {
        let backAction = UIAction { _ in
            self.dismiss(animated: true)
        }
        
        let continueAction = UIAction { _ in
            guard let fromCard = self.toCardView.chooseTypeTF.typePicker.selectedTypeText.text else { return }
            guard let toCard = self.toCardView.creditCardTextField.textField.text else { return }
            guard let amount = Int(self.toCardView.amountTextField.textField.text!) else { return }
            guard let message = self.toCardView.messageTextField.textField.text else { return }
            guard let viewmodel = self.viewModel else { return }
            let appDelegate = AppDelegate.shared
            guard let accessToken = appDelegate?.userRegisterInformation?.accessToken else { return }
            let transactionType = "CARD"
            
            self.toCardView.continueButton.setTitle("", for: .normal)
            self.toCardView.activityIndicartor.startAnimating()
            
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
                    self.toCardView.activityIndicartor.stopAnimating()
                    self.toCardView.continueButton.setTitle("continue_title".localized, for: .normal)
                }
            }
        }
        
        
        self.toCardView.navigationBar.backButton.addAction(backAction, for: .touchUpInside)
        self.toCardView.continueButton.addAction(continueAction, for: .touchUpInside)
    }
    
    func isCardArrEmpty(cardArray: [GreenBank_ViewModel.Card]) {
        while cardArray.isEmpty {
            toCardView.chooseTypeTF.typePicker.activityIndicartor.startAnimating()
            setupPicker()
        }
        toCardView.chooseTypeTF.typePicker.activityIndicartor.stopAnimating()
    }
}
