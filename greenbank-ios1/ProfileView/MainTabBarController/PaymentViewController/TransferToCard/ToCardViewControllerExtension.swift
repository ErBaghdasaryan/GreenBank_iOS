//
//  ToCardViewControllerExtension.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 19.03.24.
//

import UIKit

extension ToCardViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.layer.borderColor = UIColor.sysGray.cgColor
        
        if textField === toCardView.amountTextField.textField {
            toCardView.amountTextField.helperLabel?.text = ""
            textField.rightView = nil
        } else if textField === toCardView.creditCardTextField.textField {
            toCardView.creditCardTextField.helperLabel?.text = ""
            textField.rightView = nil
        } else if textField === toCardView.messageTextField.textField {
            toCardView.messageTextField.helperLabel?.text = ""
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case toCardView.amountTextField.textField:
            toCardView.creditCardTextField.textField.becomeFirstResponder()
            textFieldDidEndEditing(textField)
        case toCardView.creditCardTextField.textField:
            toCardView.messageTextField.textField.becomeFirstResponder()
            textFieldDidEndEditing(textField)
        case toCardView.messageTextField.textField:
            textFieldDidEndEditing(textField)
            toCardView.messageTextField.textField.resignFirstResponder()
        default:
            break
        }
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        switch textField {
        case toCardView.amountTextField.textField:
            if let text = textField.text {
                if viewModel!.validator.isAmountValid(amount: text){
                    textField.layer.borderColor = UIColor.sysTrueTFBorder.cgColor
                    let imageView = UIImageView(image: UIImage(named: "done_image".localized)?.withRenderingMode(.alwaysTemplate))
                   
                    textField.rightView = imageView
                    toCardView.amountTextField.textField.rightView = imageView
                } else {
                    toCardView.amountTextField.helperLabel?.text = "amountLabel_Error".localized
                    toCardView.amountTextField.helperLabel?.textColor = .sysFalseTFBorder
                    textField.layer.borderColor = UIColor.sysFalseTFBorder.cgColor

                    let imageView = UIImageView(image: UIImage(named: "alert_image".localized)?.withRenderingMode(.alwaysTemplate))
                    textField.rightView = imageView
                    textField.rightView?.tintColor = .sysFalseTFBorder
                }
            } else {
                toCardView.amountTextField.helperLabel?.text = "amountLabel_Error".localized
                toCardView.amountTextField.helperLabel?.textColor = .sysFalseTFBorder
                textField.layer.borderColor = UIColor.sysFalseTFBorder.cgColor
                
                let imageView = UIImageView(image: UIImage(named: "alert_image".localized)?.withRenderingMode(.alwaysTemplate))
                textField.rightView = imageView
                textField.rightView?.tintColor = .sysFalseTFBorder
            }
        case toCardView.creditCardTextField.textField:
            if let text = textField.text {
                if viewModel!.validator.isCreditCardValid(creditCard: text) {
                    textField.layer.borderColor = UIColor.sysTrueTFBorder.cgColor
                    let imageView = UIImageView(image: UIImage(named: "done_image".localized)?.withRenderingMode(.alwaysTemplate))
                    textField.rightView = imageView
                    textField.rightView?.tintColor = .sysTrueTFBorder
                } else {
                    toCardView.creditCardTextField.helperLabel?.text = "creditCardLabel_Error".localized
                    toCardView.creditCardTextField.helperLabel?.textColor = .sysFalseTFBorder
                    textField.layer.borderColor = UIColor.sysFalseTFBorder.cgColor
                    
                    let imageView = UIImageView(image: UIImage(named: "alert_image".localized)?.withRenderingMode(.alwaysTemplate))
                    textField.rightView = imageView
                    textField.rightView?.tintColor = .sysFalseTFBorder
                }
            } else {
                toCardView.creditCardTextField.helperLabel?.text = "creditCardLabel_Error".localized
                toCardView.creditCardTextField.helperLabel?.textColor = .sysFalseTFBorder
                textField.layer.borderColor = UIColor.sysFalseTFBorder.cgColor
                
                let imageView = UIImageView(image: UIImage(named: "alert_image".localized)?.withRenderingMode(.alwaysTemplate))
                      
                textField.rightView = imageView
                textField.rightView?.tintColor = .sysFalseTFBorder
            }
        case toCardView.messageTextField.textField:
            if let text = textField.text {
                if viewModel!.validator.isMessageValid(message: text) {
                    textField.layer.borderColor = UIColor.sysTrueTFBorder.cgColor
                    textField.rightView?.tintColor = .sysTrueTFBorder
                } else {
                    toCardView.messageTextField.helperLabel?.text = "messageLabel_Error".localized
                    toCardView.messageTextField.helperLabel?.textColor = .sysFalseTFBorder
                    textField.layer.borderColor = UIColor.sysFalseTFBorder.cgColor
                    textField.rightView?.tintColor = .sysFalseTFBorder
                }
            } else {
                toCardView.messageTextField.helperLabel?.text = "messageLabel_Error".localized
                toCardView.messageTextField.helperLabel?.textColor = .sysFalseTFBorder
                textField.layer.borderColor = UIColor.sysFalseTFBorder.cgColor
                textField.rightView?.tintColor = .sysFalseTFBorder
            }
        default:
            break
        }
    }
}
