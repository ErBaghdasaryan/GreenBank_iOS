//
//  LoginViewControllerExtension.swift
//  greenbank-ios1
//
//  Created by Hovo Ohanyan on 22.01.24.
//

import UIKit
import GreenBank_UIComponents

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.layer.borderColor = UIColor.sysGray.cgColor
        textField.rightView?.tintColor = .sysGray
        
        if textField === loginView.emailTextField.textField  {
            loginView.emailTextField.helperLabel?.text = ""
        } else if textField === loginView.passwordTextField.textField {
            loginView.passwordTextField.helperLabel?.text = ""
        }
            
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case loginView.emailTextField.textField:
            loginView.passwordTextField.textField.becomeFirstResponder()
            textFieldDidEndEditing(textField)
        case loginView.passwordTextField.textField:
            textFieldDidEndEditing(textField)
            loginView.passwordTextField.textField.resignFirstResponder()
        default:
            break
        }
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case loginView.emailTextField.textField:
            if let text = textField.text {
                if viewModel!.validator.emailValidation(email: text) {
                    textField.layer.borderColor = UIColor.sysTrueTFBorder.cgColor
                    textField.rightView?.tintColor = .sysTrueTFBorder
                } else {
                    loginView.emailTextField.helperLabel?.text = "email_error".localized
                    loginView.emailTextField.helperLabel?.textColor = .sysFalseTFBorder
                    textField.rightView?.tintColor = .sysFalseTFBorder
                    textField.layer.borderColor = UIColor.sysFalseTFBorder.cgColor
                }
            } else {
                loginView.emailTextField.helperLabel?.text = "email_error".localized
                loginView.emailTextField.helperLabel?.textColor = .sysFalseTFBorder
                textField.rightView?.tintColor = .sysFalseTFBorder
                textField.layer.borderColor = UIColor.sysFalseTFBorder.cgColor
            }
        case loginView.passwordTextField.textField:
            if let text = textField.text {
                if viewModel!.validator.passwordValidation(password: text) {
                    textField.layer.borderColor = UIColor.sysTrueTFBorder.cgColor
                    textField.rightView?.tintColor = .sysTrueTFBorder
                } else {
                    loginView.passwordTextField.helperLabel?.text = "password_error".localized
                    loginView.passwordTextField.helperLabel?.textColor = .sysFalseTFBorder
                    textField.rightView?.tintColor = .sysFalseTFBorder
                    textField.layer.borderColor = UIColor.sysFalseTFBorder.cgColor
                }
            } else {
                loginView.passwordTextField.helperLabel?.text = "password_error".localized
                loginView.passwordTextField.helperLabel?.textColor = .sysFalseTFBorder
                textField.rightView?.tintColor = .sysFalseTFBorder
                textField.layer.borderColor = UIColor.sysFalseTFBorder.cgColor
            }
        default:
            break
        }
    }
}
