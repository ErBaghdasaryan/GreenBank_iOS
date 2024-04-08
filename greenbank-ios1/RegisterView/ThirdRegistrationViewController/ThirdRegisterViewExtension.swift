//
//  ThirdRegisterViewExtension.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 25.01.24.
//

import UIKit

extension ThirdRegistrViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let character = string.first, character.isNumber else {
            return false
        }
        
        textField.text = string
        
        let allTextFieldsFilled = registerView.textFieldStackView.arrangedSubviews.allSatisfy { ($0 as? UITextField)?.text?.isEmpty == false }
        
        if allTextFieldsFilled {
            var number = ""
            for textField in registerView.textFieldStackView.arrangedSubviews {
                if let textField = textField as? UITextField {
                    number += textField.text ?? ""
                }
            }
            self.number = number
        }
        
        if textField == registerView.textFieldStackView.arrangedSubviews.last as? UITextField {
            textField.resignFirstResponder()
        } else {
            if let nextTextField = registerView.textFieldStackView.arrangedSubviews.first(where: { ($0 as? UITextField)?.text?.isEmpty == true }) as? UITextField {
                nextTextField.becomeFirstResponder()
            }
        }
        
        return false
    }
}
