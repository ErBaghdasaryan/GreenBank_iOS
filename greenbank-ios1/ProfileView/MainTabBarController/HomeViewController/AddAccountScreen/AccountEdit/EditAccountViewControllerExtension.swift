//
//  EditAccountViewControllerExtension.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 16.03.24.
//

import UIKit

extension EditAccountViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.layer.borderColor = UIColor.sysGray.cgColor
        textField.rightView?.tintColor = .sysGray
        
        if textField === editAccountView.cardHolderNameTextField.textField  {
            editAccountView.cardHolderNameTextField.helperLabel?.text = ""
        } else if textField === editAccountView.currencyPickerView.currencyPicker.selectedCurrencyText {
            
        }
            
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        editAccountView.cardHolderNameTextField.textField.resignFirstResponder()
        textFieldDidEndEditing(textField)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text {
            if  self.viewModel!.validator.isCardHolderNameValid(name: text) {
                textField.layer.borderColor = UIColor.sysTrueTFBorder.cgColor
                textField.rightView?.tintColor = .sysTrueTFBorder
            } else {
                editAccountView.cardHolderNameTextField.helperLabel?.text = "cardHolderName_Error".localized
                editAccountView.cardHolderNameTextField.helperLabel?.textColor = .sysFalseTFBorder
                textField.rightView?.tintColor = .sysFalseTFBorder
                textField.layer.borderColor = UIColor.sysFalseTFBorder.cgColor
            }
        } else {
            editAccountView.cardHolderNameTextField.helperLabel?.text = "cardHolderName_Error".localized
            editAccountView.cardHolderNameTextField.helperLabel?.textColor = .sysFalseTFBorder
            textField.rightView?.tintColor = .sysFalseTFBorder
            textField.layer.borderColor = UIColor.sysFalseTFBorder.cgColor
            
        }
    }
}
