//
//  EditCardViewController.swift
//  greenbank-ios1
//
//  Created by Hovo Ohanyan on 08.02.24.
//

import UIKit
import GreenBank_ViewModel

final class EditCardViewController: BaseViewController<AddCardViewModel> {
    
    let editCardView = EditCardView()
    private var editModel = EditModel()
    weak var delegate: IViewControllerDelegate?
    private var cardType: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        readFromJSON()
        setupDelegate()
        setupUI()
        makeButtonAction()
        setUpViewModel()
    }
    
    private func setupDelegate() {
        self.editCardView.currencyPickerView.currencyPicker.selectedCurrencyText.delegate = self
        self.editCardView.cardHolderNameTextField.textField.delegate = self
    }
    
    private func setupUI() {
        
        editCardView.frame = view.frame
        
        editCardView.setupUI(withData: editModel)
        
        view.addSubview(editCardView)
    }
    
    private func setUpViewModel() {
        self.viewModel = AddCardViewModel()
    }
    
    private func readFromJSON() {
        guard let filePath = Bundle.main.path(forResource: "Currency", ofType: "json") else {
            return
        }
        
        let fileURL = URL(fileURLWithPath: filePath)
        
        do {
            let data = try Data(contentsOf: fileURL)
            
            let currencyTypes =  try JSONDecoder().decode([CurrencyType].self, from: data)
            
            for currency in currencyTypes {
                self.editModel.currency.append(currency.currencyType)
            }
        } catch {
            
        }
    }
    
    private func makeButtonAction() {
        let backAction = UIAction { _ in
            self.delegate?.viewControllerDismiss()
            self.dismiss(animated: false)
        }
        
        let tapToPickerGesture = UITapGestureRecognizer(target: self, action: #selector(pickerTapped))
        
        editCardView.selectCardTypeVisa.addTarget(self, action: #selector(selectedMasterOrVisa(_:)), for: .touchUpInside)
        editCardView.selectCardTypeMaster.addTarget(self, action: #selector(selectedMasterOrVisa(_:)), for: .touchUpInside)
        editCardView.currencyPickerView.currencyPicker.addGestureRecognizer(tapToPickerGesture)
        
        let continueAction = UIAction { _ in
            let currency = self.editCardView.currencyPickerView.currencyPicker.selectedCurrency
            guard self.viewModel != nil else { return }
            guard let cardType = self.cardType else {
                self.editCardView.wrongCardTypeLabel.text = "Please select the card form before proceeding."
                
                return
            }
            
            guard let cardView = self.editCardView.cardView as? CardView else { return }
            let firstColorFromHex = cardView.firstHalfView.backgroundColor?.toHex()
            let secondColorFromHex = cardView.secondHalfView.backgroundColor?.toHex()
            
            self.editCardView.continueButton.setTitle("", for: .normal)
            self.editCardView.activityIndicartor.startAnimating()
            
            Task {
                do {
                    if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                        if let accessToken = appDelegate.userRegisterInformation?.accessToken,
                           let ownerId = appDelegate.userRegisterInformation?.userDto.id {
                            let data = try await self.viewModel?.creatCard(ownerId: ownerId,
                                                                           cardType: cardType,
                                                                           currency: currency, 
                                                                           firstHex: firstColorFromHex!,
                                                                           secondHex: secondColorFromHex!,
                                                                           accessToken: accessToken)?.value
                            let updatedUserInfo = try await self.viewModel?.getUser(accessToken: accessToken,
                                                                                    userID: ownerId)?.value
                            
//                            AppDelegate.shared?.userRegisterInformation?.userDto = updatedUserInfo!
                            
                        }
                    }
                        
                    let nextVC = MainTabBarController()
                    nextVC.modalPresentationStyle = .fullScreen
                    self.present(nextVC, animated: true)
                    
                } catch {
                    self.editCardView.activityIndicartor.stopAnimating()
                    self.editCardView.continueButton.setTitle("continue_title".localized, for: .normal)
                }
            }
            
        }
        
        editCardView.navigationBar.backButton.addAction(backAction,
                                                        for: .touchUpInside)
        editCardView.continueButton.addAction(continueAction, for: .touchUpInside)
    }
    
    @objc private func selectedMasterOrVisa(_ sender: UIButton) {
        switch sender {
        case editCardView.selectCardTypeVisa:
            
            editCardView.selectCardTypeMaster.imageView?.isHidden = true
            editCardView.selectCardTypeMaster.layer.borderColor = UIColor.lightGray.cgColor
            
            if editCardView.selectCardTypeVisa.layer.borderColor == UIColor.sysGradientFirst.cgColor {
                editCardView.selectCardTypeVisa.imageView?.isHidden = true
                editCardView.selectCardTypeVisa.layer.borderColor = UIColor.lightGray.cgColor
                self.cardType = nil
                break
            }
            
            editCardView.selectCardTypeVisa.layer.borderColor = UIColor.sysGradientFirst.cgColor
            editCardView.selectCardTypeVisa.setImage(UIImage(named: "selected_button_image".localized)?.withRenderingMode(.alwaysTemplate), for: .normal)
            editCardView.selectCardTypeVisa.tintColor = .sysGradientFirst
            editCardView.selectCardTypeVisa.imageView?.contentMode = .scaleAspectFit
            
            if let cardView = editCardView.cardView as? CardView {
                cardView.changeCardType(cardType: "Visa")
            }
            self.cardType = "VISA"
            
        case editCardView.selectCardTypeMaster:
            editCardView.selectCardTypeVisa.imageView?.isHidden = true
            editCardView.selectCardTypeVisa.layer.borderColor = UIColor.lightGray.cgColor
            
            if editCardView.selectCardTypeMaster.layer.borderColor == UIColor.sysGradientFirst.cgColor {
                editCardView.selectCardTypeMaster.imageView?.isHidden = true
                editCardView.selectCardTypeMaster.layer.borderColor = UIColor.lightGray.cgColor
                self.cardType = nil
                break
            }

            editCardView.selectCardTypeMaster.layer.borderColor = UIColor.sysGradientFirst.cgColor
            editCardView.selectCardTypeMaster.setImage(UIImage(named: "selected_button_image".localized)?.withRenderingMode(.alwaysTemplate), for: .normal)
            editCardView.selectCardTypeMaster.tintColor = .sysGradientFirst
            editCardView.selectCardTypeMaster.imageView?.contentMode = .scaleAspectFit
            
            if let cardView = editCardView.cardView as? CardView {
                cardView.changeCardType(cardType: "Master")
            }
            self.cardType = "MASTERCARD"
            
        default:
            fatalError()
        }
    }
    
    @objc private func pickerTapped() {
        
        let currentPickerText = editCardView.currencyPickerView.currencyPicker.selectedCurrency
        
        if let cardView = editCardView.cardView as? CardView {
            switch currentPickerText {
            case "USD":
                cardView.changeCardType(currencyType: "USD")
            case "EUR":
                cardView.changeCardType(currencyType: "EUR")
            case "AMD":
                cardView.changeCardType(currencyType: "AMD")
            default :
                fatalError()
            }
        }else {
            fatalError()
        }
    }
}
