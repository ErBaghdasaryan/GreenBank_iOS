//
//  EditCardViewControllerExtension.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 15.03.24.
//

import UIKit

extension EditCardViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.layer.borderColor = UIColor.sysGray.cgColor
        textField.rightView?.tintColor = .sysGray
        
        if textField === editCardView.cardHolderNameTextField.textField  {
            editCardView.cardHolderNameTextField.helperLabel?.text = ""
        } else if textField === editCardView.currencyPickerView.currencyPicker.selectedCurrencyText {
            
        }
            
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        editCardView.cardHolderNameTextField.textField.resignFirstResponder()
        textFieldDidEndEditing(textField)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text {
            if  viewModel!.validator.isCardHolderNameValid(name: text) {
                textField.layer.borderColor = UIColor.sysTrueTFBorder.cgColor
                textField.rightView?.tintColor = .sysTrueTFBorder
            } else {
                editCardView.cardHolderNameTextField.helperLabel?.text = "cardHolderName_Error".localized
                editCardView.cardHolderNameTextField.helperLabel?.textColor = .sysFalseTFBorder
                textField.rightView?.tintColor = .sysFalseTFBorder
                textField.layer.borderColor = UIColor.sysFalseTFBorder.cgColor
            }
        } else {
            editCardView.cardHolderNameTextField.helperLabel?.text = "cardHolderName_Error".localized
            editCardView.cardHolderNameTextField.helperLabel?.textColor = .sysFalseTFBorder
            textField.rightView?.tintColor = .sysFalseTFBorder
            textField.layer.borderColor = UIColor.sysFalseTFBorder.cgColor
            
        }
    }
}
