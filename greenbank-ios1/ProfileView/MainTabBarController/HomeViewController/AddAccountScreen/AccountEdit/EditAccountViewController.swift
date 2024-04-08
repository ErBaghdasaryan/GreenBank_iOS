//
//  EditAccountViewController.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 05.03.24.
//

import UIKit
import GreenBank_ViewModel

final class EditAccountViewController: BaseViewController<AddAccountViewModel> {
    
    let editAccountView = EditAccountView()
    private var editModel = EditModel()
    weak var delegate: IViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        readFromJSON()
        setUpViewModel()
        setupDelegates()
        setupUI()
        makeButtonAction()
    }
    
    private func setUpViewModel() {
        self.viewModel = AddAccountViewModel()
    }
    
    private func setupDelegates() {
        editAccountView.cardHolderNameTextField.textField.delegate = self
    }
    
    private func readFromJSON() {
        guard let filePath = Bundle.main.path(forResource: "Currency", ofType: "json") else {
            return
        }
        
        let fileURL = URL(fileURLWithPath: filePath)
        print(filePath)
        do {
            let data = try Data(contentsOf: fileURL)
            
            let currencyTypes =  try JSONDecoder().decode([CurrencyType].self, from: data)
            
            print(currencyTypes)
            for currency in currencyTypes {
                self.editModel.currency.append(currency.currencyType)
                //self.editModel.currency = viewModel.readFromJson()
            }
        } catch {
            
        }
    }
    
    private func setupUI() {
        editAccountView.frame = view.frame
        editAccountView.setupUI(withData: editModel)
        view.addSubview(editAccountView)
    }
    
    private func makeButtonAction() {
        
        let backAction = UIAction { _ in
            self.dismiss(animated: true)
        }
        
        let continueAction = UIAction { _ in
            let currency = self.editAccountView.currencyPickerView.currencyPicker.selectedCurrency
            guard let viewModel = self.viewModel else { return }
            let accountType = "CURRENT"
            
            self.editAccountView.continueButton.setTitle("", for: .normal)
            self.editAccountView.activityIndicartor.startAnimating()
            
            Task {
                do {
                    if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                        if let accessToken = appDelegate.userRegisterInformation?.accessToken,
                           let ownerId = appDelegate.userRegisterInformation?.userDto.id {
                            let data = try await viewModel.creatAccount(ownerId: ownerId,
                                                                              accountType: accountType,
                                                                              currency: currency,
                                                                              accessToken: accessToken)?.value
                            
                        }
                    }
                    let nextVC = MainTabBarController()
                    nextVC.modalPresentationStyle = .fullScreen
                    self.present(nextVC, animated: true)
                } catch {
                    self.editAccountView.continueButton.setTitle("continue_title".localized, for: .normal)
                    self.editAccountView.activityIndicartor.stopAnimating()
                }
            }
        }
        
        self.editAccountView.navigationBar.backButton.addAction(backAction, for: .touchUpInside)
        self.editAccountView.continueButton.addAction(continueAction, for: .touchUpInside)
    }
}
