//
//  SecondRegisterViewControllerExtension.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 26.01.24.
//

import UIKit

extension SecondRegisterViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.layer.borderColor = UIColor.sysGray.cgColor
        
        if textField === registerView.emailTF.textField {
            registerView.emailTF.helperLabel?.text = ""
            textField.rightView = nil
        } else if textField === registerView.phoneNumberTF.textField {
            registerView.phoneNumberTF.helperLabel?.text = ""
            textField.rightView = nil
        } else if textField === registerView.passwordTF.textField {
            registerView.passwordTF.helperLabel?.text = ""
        } else if textField === registerView.repeatPasswordTF.textField {
            registerView.repeatPasswordTF.helperLabel?.text = ""
        }
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case registerView.emailTF.textField:
            registerView.phoneNumberTF.textField.becomeFirstResponder()
            textFieldDidEndEditing(textField)
        case registerView.phoneNumberTF.textField:
            registerView.passwordTF.textField.becomeFirstResponder()
            textFieldDidEndEditing(textField)
        case registerView.passwordTF.textField:
            registerView.repeatPasswordTF.textField.becomeFirstResponder()
            textFieldDidEndEditing(textField)
        case registerView.repeatPasswordTF.textField:
            textFieldDidEndEditing(textField)
            registerView.repeatPasswordTF.textField.resignFirstResponder()
        default:
            break
        }
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        switch textField {
        case registerView.emailTF.textField:
            if let text = textField.text {
                if viewModel!.validator.emailValidation(email: text) {
                    textField.layer.borderColor = UIColor.sysTrueTFBorder.cgColor
                    let imageView = UIImageView(image: UIImage(named: "done_image".localized)?.withRenderingMode(.alwaysTemplate))
                   
                    textField.rightView = imageView
                    registerView.emailTF.textField.rightView = imageView
                } else {
                    registerView.emailTF.helperLabel?.text = "email_error".localized
                    registerView.emailTF.helperLabel?.textColor = .sysFalseTFBorder
                    textField.layer.borderColor = UIColor.sysFalseTFBorder.cgColor

                    let imageView = UIImageView(image: UIImage(named: "alert_image".localized)?.withRenderingMode(.alwaysTemplate))
                    textField.rightView = imageView
                    textField.rightView?.tintColor = .sysFalseTFBorder
                }
            } else {
                registerView.emailTF.helperLabel?.text = "email_error".localized
                registerView.emailTF.helperLabel?.textColor = .sysFalseTFBorder
                textField.layer.borderColor = UIColor.sysFalseTFBorder.cgColor
                
                let imageView = UIImageView(image: UIImage(named: "alert_image".localized)?.withRenderingMode(.alwaysTemplate))
                textField.rightView = imageView
                textField.rightView?.tintColor = .sysFalseTFBorder
            }
        case registerView.phoneNumberTF.textField:
            if let text = textField.text {
                if viewModel!.validator.isValidArmenianPhoneNumber(phoneNumber: text) {
                    textField.layer.borderColor = UIColor.sysTrueTFBorder.cgColor
                    let imageView = UIImageView(image: UIImage(named: "done_image".localized)?.withRenderingMode(.alwaysTemplate))
                    textField.rightView = imageView
                    textField.rightView?.tintColor = .sysTrueTFBorder
                } else {
                    registerView.phoneNumberTF.helperLabel?.text = "phoneNumber_error".localized
                    registerView.phoneNumberTF.helperLabel?.textColor = .sysFalseTFBorder
                    textField.layer.borderColor = UIColor.sysFalseTFBorder.cgColor
                    
                    let imageView = UIImageView(image: UIImage(named: "alert_image".localized)?.withRenderingMode(.alwaysTemplate))
                    textField.rightView = imageView
                    textField.rightView?.tintColor = .sysFalseTFBorder
                }
            } else {
                registerView.phoneNumberTF.helperLabel?.text = "phoneNumber_error".localized
                registerView.phoneNumberTF.helperLabel?.textColor = .sysFalseTFBorder
                textField.layer.borderColor = UIColor.sysFalseTFBorder.cgColor
                
                let imageView = UIImageView(image: UIImage(named: "alert_image".localized)?.withRenderingMode(.alwaysTemplate))
                      
                textField.rightView = imageView
                textField.rightView?.tintColor = .sysFalseTFBorder
            }
        case registerView.passwordTF.textField:
            if let text = textField.text {
                if viewModel!.validator.passwordValidation(password: text) {
                    self.passwordText = text
                    textField.layer.borderColor = UIColor.sysTrueTFBorder.cgColor
                    textField.rightView?.tintColor = .sysTrueTFBorder
                } else {
                    self.passwordText = text
                    registerView.passwordTF.helperLabel?.text = "password_error".localized
                    registerView.passwordTF.helperLabel?.textColor = .sysFalseTFBorder
                    textField.layer.borderColor = UIColor.sysFalseTFBorder.cgColor
                    textField.rightView?.tintColor = .sysFalseTFBorder
                }
            } else {
                registerView.passwordTF.helperLabel?.text = "password_error".localized
                registerView.passwordTF.helperLabel?.textColor = .sysFalseTFBorder
                textField.layer.borderColor = UIColor.sysFalseTFBorder.cgColor
                textField.rightView?.tintColor = .sysFalseTFBorder
            }
            
        case registerView.repeatPasswordTF.textField:
            if let text = textField.text {
                if viewModel!.validator.confirmPasswordValidation(password: self.passwordText!, confirmPassword: text) {
                    textField.layer.borderColor = UIColor.sysTrueTFBorder.cgColor
                    textField.rightView?.tintColor = .sysTrueTFBorder
                    
                } else {
                    registerView.repeatPasswordTF.helperLabel?.text = "password_error".localized
                    registerView.repeatPasswordTF.helperLabel?.textColor = .sysFalseTFBorder
                    textField.layer.borderColor = UIColor.sysFalseTFBorder.cgColor
                    textField.rightView?.tintColor = .sysFalseTFBorder
                }
            } else {
                registerView.repeatPasswordTF.helperLabel?.text = "password_error".localized
                registerView.repeatPasswordTF.helperLabel?.textColor = .sysFalseTFBorder
                textField.layer.borderColor = UIColor.sysFalseTFBorder.cgColor
                textField.rightView?.tintColor = .sysFalseTFBorder
            }
        default:
            break
        }
    }
}
