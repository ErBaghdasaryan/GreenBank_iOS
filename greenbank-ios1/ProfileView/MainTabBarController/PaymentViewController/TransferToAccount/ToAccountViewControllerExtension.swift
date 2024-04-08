//
//  ToAccountViewControllerExtension.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 19.03.24.
//

import UIKit

extension ToAccountViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.layer.borderColor = UIColor.sysGray.cgColor
        
        if textField === toAccountView.amountTextField.textField {
            toAccountView.amountTextField.helperLabel?.text = ""
            textField.rightView = nil
        } else if textField === toAccountView.creditAccountTextField.textField {
            toAccountView.creditAccountTextField.helperLabel?.text = ""
            textField.rightView = nil
        } else if textField === toAccountView.messageTextField.textField {
            toAccountView.messageTextField.helperLabel?.text = ""
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case toAccountView.amountTextField.textField:
            toAccountView.creditAccountTextField.textField.becomeFirstResponder()
            textFieldDidEndEditing(textField)
        case toAccountView.creditAccountTextField.textField:
            toAccountView.messageTextField.textField.becomeFirstResponder()
            textFieldDidEndEditing(textField)
        case toAccountView.messageTextField.textField:
            textFieldDidEndEditing(textField)
            toAccountView.messageTextField.textField.resignFirstResponder()
        default:
            break
        }
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        switch textField {
        case toAccountView.amountTextField.textField:
            if let text = textField.text {
                if viewModel!.validator.isAmountValid(amount: text){
                    textField.layer.borderColor = UIColor.sysTrueTFBorder.cgColor
                    let imageView = UIImageView(image: UIImage(named: "done_image".localized)?.withRenderingMode(.alwaysTemplate))
                   
                    textField.rightView = imageView
                    toAccountView.amountTextField.textField.rightView = imageView
                } else {
                    toAccountView.amountTextField.helperLabel?.text = "amountLabel_Error".localized
                    toAccountView.amountTextField.helperLabel?.textColor = .sysFalseTFBorder
                    textField.layer.borderColor = UIColor.sysFalseTFBorder.cgColor

                    let imageView = UIImageView(image: UIImage(named: "alert_image".localized)?.withRenderingMode(.alwaysTemplate))
                    textField.rightView = imageView
                    textField.rightView?.tintColor = .sysFalseTFBorder
                }
            } else {
                toAccountView.amountTextField.helperLabel?.text = "amountLabel_Error".localized
                toAccountView.amountTextField.helperLabel?.textColor = .sysFalseTFBorder
                textField.layer.borderColor = UIColor.sysFalseTFBorder.cgColor
                
                let imageView = UIImageView(image: UIImage(named: "alert_image".localized)?.withRenderingMode(.alwaysTemplate))
                textField.rightView = imageView
                textField.rightView?.tintColor = .sysFalseTFBorder
            }
        case toAccountView.creditAccountTextField.textField:
            if let text = textField.text {
                if viewModel!.validator.isAccountNumberValid(accountNumber: text) {
                    textField.layer.borderColor = UIColor.sysTrueTFBorder.cgColor
                    let imageView = UIImageView(image: UIImage(named: "done_image".localized)?.withRenderingMode(.alwaysTemplate))
                    textField.rightView = imageView
                    textField.rightView?.tintColor = .sysTrueTFBorder
                } else {
                    toAccountView.creditAccountTextField.helperLabel?.text = "messageLabel_Error".localized
                    toAccountView.creditAccountTextField.helperLabel?.textColor = .sysFalseTFBorder
                    textField.layer.borderColor = UIColor.sysFalseTFBorder.cgColor
                    
                    let imageView = UIImageView(image: UIImage(named: "alert_image".localized)?.withRenderingMode(.alwaysTemplate))
                    textField.rightView = imageView
                    textField.rightView?.tintColor = .sysFalseTFBorder
                }
            } else {
                toAccountView.creditAccountTextField.helperLabel?.text = "messageLabel_Error".localized
                toAccountView.creditAccountTextField.helperLabel?.textColor = .sysFalseTFBorder
                textField.layer.borderColor = UIColor.sysFalseTFBorder.cgColor
                
                let imageView = UIImageView(image: UIImage(named: "alert_image".localized)?.withRenderingMode(.alwaysTemplate))
                      
                textField.rightView = imageView
                textField.rightView?.tintColor = .sysFalseTFBorder
            }
        case toAccountView.messageTextField.textField:
            if let text = textField.text {
                if viewModel!.validator.isMessageValid(message: text) {
                    textField.layer.borderColor = UIColor.sysTrueTFBorder.cgColor
                    textField.rightView?.tintColor = .sysTrueTFBorder
                } else {
                    toAccountView.messageTextField.helperLabel?.text = "messageLabel_Error".localized
                    toAccountView.messageTextField.helperLabel?.textColor = .sysFalseTFBorder
                    textField.layer.borderColor = UIColor.sysFalseTFBorder.cgColor
                    textField.rightView?.tintColor = .sysFalseTFBorder
                }
            } else {
                toAccountView.messageTextField.helperLabel?.text = "messageLabel_Error".localized
                toAccountView.messageTextField.helperLabel?.textColor = .sysFalseTFBorder
                textField.layer.borderColor = UIColor.sysFalseTFBorder.cgColor
                textField.rightView?.tintColor = .sysFalseTFBorder
            }
        default:
            break
        }
    }
}
