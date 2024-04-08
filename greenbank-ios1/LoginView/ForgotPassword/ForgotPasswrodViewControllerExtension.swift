//
//  ForgotPasswrodViewControllerExtension.swift
//  greenbank-ios1
//
//  Created by Hovo Ohanyan on 25.01.24.
//

import UIKit

extension ForgotPasswordViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text != nil {
            print("called")
            textField.resignFirstResponder()
            textFieldDidEndEditing(textField)
        }
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text {
            if self.viewModel!.validator.emailValidation(email: text) {
                
            } else {
                textField.layer.borderColor = UIColor.red.cgColor
            }
        }
    }
}
