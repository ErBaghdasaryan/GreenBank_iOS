//
//  ToPhoneViewControllerExtension.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 03.04.24.
//

import UIKit

extension ToPhoneViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.layer.borderColor = UIColor.sysGray.cgColor
        
        if textField === toPhoneView.amountTextField.textField {
            toPhoneView.amountTextField.helperLabel?.text = ""
            textField.rightView = nil
        } else if textField === toPhoneView.creditPhoneTextField.textField {
            toPhoneView.creditPhoneTextField.helperLabel?.text = ""
            textField.rightView = nil
        } else if textField === toPhoneView.messageTextField.textField {
            toPhoneView.messageTextField.helperLabel?.text = ""
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case toPhoneView.amountTextField.textField:
            textFieldDidEndEditing(textField)
            toPhoneView.creditPhoneTextField.textField.becomeFirstResponder()
        case toPhoneView.creditPhoneTextField.textField:
            textFieldDidEndEditing(textField)
            toPhoneView.messageTextField.textField.becomeFirstResponder()
        case toPhoneView.messageTextField.textField:
            textFieldDidEndEditing(textField)
            toPhoneView.messageTextField.textField.resignFirstResponder()
        default:
            break
        }
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        switch textField {
        case toPhoneView.amountTextField.textField:
            if let text = textField.text {
                if viewModel!.validator.isAmountValid(amount: text){
                    textField.layer.borderColor = UIColor.sysTrueTFBorder.cgColor
                    let imageView = UIImageView(image: UIImage(named: "done_image".localized)?.withRenderingMode(.alwaysTemplate))
                   
                    textField.rightView = imageView
                    toPhoneView.amountTextField.textField.rightView = imageView
                } else {
                    toPhoneView.amountTextField.helperLabel?.text = "amountLabel_Error".localized
                    toPhoneView.amountTextField.helperLabel?.textColor = .sysFalseTFBorder
                    textField.layer.borderColor = UIColor.sysFalseTFBorder.cgColor

                    let imageView = UIImageView(image: UIImage(named: "alert_image".localized)?.withRenderingMode(.alwaysTemplate))
                    textField.rightView = imageView
                    textField.rightView?.tintColor = .sysFalseTFBorder
                }
            } else {
                toPhoneView.amountTextField.helperLabel?.text = "amountLabel_Error".localized
                toPhoneView.amountTextField.helperLabel?.textColor = .sysFalseTFBorder
                textField.layer.borderColor = UIColor.sysFalseTFBorder.cgColor
                
                let imageView = UIImageView(image: UIImage(named: "alert_image".localized)?.withRenderingMode(.alwaysTemplate))
                textField.rightView = imageView
                textField.rightView?.tintColor = .sysFalseTFBorder
            }
        case toPhoneView.creditPhoneTextField.textField:
            if let text = textField.text {
                if (viewModel!.validator.validateAndFormatArmenianPhoneNumber(text) != nil) {
                    textField.layer.borderColor = UIColor.sysTrueTFBorder.cgColor
                    textField.text = self.viewModel?.validator.validateAndFormatArmenianPhoneNumber(text)
                    let imageView = UIImageView(image: UIImage(named: "done_image".localized)?.withRenderingMode(.alwaysTemplate))
                    textField.rightView = imageView
                    textField.rightView?.tintColor = .sysTrueTFBorder
                } else {
                    toPhoneView.creditPhoneTextField.helperLabel?.text = "messageLabel_Error".localized
                    toPhoneView.creditPhoneTextField.helperLabel?.textColor = .sysFalseTFBorder
                    textField.layer.borderColor = UIColor.sysFalseTFBorder.cgColor
                    
                    let imageView = UIImageView(image: UIImage(named: "contactImage")?.withRenderingMode(.alwaysTemplate))
                    textField.rightView = imageView
                    textField.rightView?.tintColor = .sysFalseTFBorder
                }
            } else {
                toPhoneView.creditPhoneTextField.helperLabel?.text = "messageLabel_Error".localized
                toPhoneView.creditPhoneTextField.helperLabel?.textColor = .sysFalseTFBorder
                textField.layer.borderColor = UIColor.sysFalseTFBorder.cgColor
                
                let imageView = UIImageView(image: UIImage(named: "alert_image".localized)?.withRenderingMode(.alwaysTemplate))
                      
                textField.rightView = imageView
                textField.rightView?.tintColor = .sysFalseTFBorder
            }
        case toPhoneView.messageTextField.textField:
            if let text = textField.text {
                if viewModel!.validator.isMessageValid(message: text) {
                    textField.layer.borderColor = UIColor.sysTrueTFBorder.cgColor
                    textField.rightView?.tintColor = .sysTrueTFBorder
                } else {
                    toPhoneView.messageTextField.helperLabel?.text = "messageLabel_Error".localized
                    toPhoneView.messageTextField.helperLabel?.textColor = .sysFalseTFBorder
                    textField.layer.borderColor = UIColor.sysFalseTFBorder.cgColor
                    textField.rightView?.tintColor = .sysFalseTFBorder
                }
            } else {
                toPhoneView.messageTextField.helperLabel?.text = "messageLabel_Error".localized
                toPhoneView.messageTextField.helperLabel?.textColor = .sysFalseTFBorder
                textField.layer.borderColor = UIColor.sysFalseTFBorder.cgColor
                textField.rightView?.tintColor = .sysFalseTFBorder
            }
        default:
            break
        }
    }
}
