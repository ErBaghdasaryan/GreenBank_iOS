//
//  FirstRegisterViewControllerExtension.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 26.01.24.
//

import UIKit

extension FirstRegisterViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.layer.borderColor = UIColor.sysGray.cgColor
        textField.rightView = nil
        
        if textField == self.registerView.nameTF.textField {
            registerView.nameTF.helperLabel?.text = ""
        } else if textField == self.registerView.lastNameTF.textField {
            registerView.lastNameTF.helperLabel?.text = ""
        }
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case registerView.nameTF.textField:
            registerView.lastNameTF.textField.becomeFirstResponder()
            textFieldDidEndEditing(textField)
        case registerView.lastNameTF.textField:
            registerView.lastNameTF.textField.resignFirstResponder()
            textFieldDidEndEditing(textField)
        case registerView.datePicker.datePickerViewDay.selectedDayText:
            registerView.datePicker.datePickerViewDay.selectedDayText.becomeFirstResponder()
            textFieldDidEndEditing(textField)
        case registerView.datePicker.datePickerViewMonth.selectedMonthText:
            registerView.datePicker.datePickerViewMonth.selectedMonthText.becomeFirstResponder()
            textFieldDidEndEditing(textField)
        case registerView.datePicker.datePickerViewYear.selectedYearText:
            textFieldDidEndEditing(textField)
            registerView.datePicker.datePickerViewYear.selectedYearText.resignFirstResponder()
        default:
            break
        }
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case registerView.nameTF.textField:
            if let text = textField.text {
                if viewModel!.validator.isValidFirstName(firstName: text) {
                    textField.layer.borderColor = UIColor.sysTrueTFBorder.cgColor
                    
                    let imageView = UIImageView(image: UIImage(named: "done_image".localized)?.withRenderingMode(.alwaysTemplate))
                    textField.rightView = imageView
                    textField.rightView?.tintColor = .sysTrueTFBorder
                } else {
                    registerView.nameTF.helperLabel?.text = "firstName_error".localized
                    registerView.nameTF.helperLabel?.textColor = .sysFalseTFBorder
                    textField.layer.borderColor = UIColor.sysFalseTFBorder.cgColor
                                        
                    let imageView = UIImageView(image: UIImage(named: "alert_image".localized)?.withRenderingMode(.alwaysTemplate))
                    textField.rightView = imageView
                    textField.rightView?.tintColor = .sysFalseTFBorder
                }
            } else {
                registerView.nameTF.helperLabel?.text = "firstName_error".localized
                registerView.nameTF.helperLabel?.textColor = .sysFalseTFBorder
                textField.layer.borderColor = UIColor.sysFalseTFBorder.cgColor
                
                let imageView = UIImageView(image: UIImage(named: "alert_image".localized)?.withRenderingMode(.alwaysTemplate))
                textField.rightView = imageView
                textField.rightView?.tintColor = .sysFalseTFBorder
            }
        case registerView.lastNameTF.textField:
            if let text = textField.text {
                if viewModel!.validator.isValidLastName(lastName: text) {
                    textField.layer.borderColor = UIColor.sysTrueTFBorder.cgColor
                    
                    let imageView = UIImageView(image: UIImage(named: "done_image".localized)?.withRenderingMode(.alwaysTemplate))
                    textField.rightView = imageView
                    textField.rightView?.tintColor = .sysTrueTFBorder
                } else {
                    registerView.lastNameTF.helperLabel?.text = "lastName_error".localized
                    registerView.lastNameTF.helperLabel?.textColor = .sysFalseTFBorder
                    textField.layer.borderColor = UIColor.sysFalseTFBorder.cgColor
                    
                    let imageView = UIImageView(image: UIImage(named: "alert_image".localized)?.withRenderingMode(.alwaysTemplate))
                    textField.rightView = imageView
                    textField.rightView?.tintColor = .sysFalseTFBorder
                }
            } else {
                registerView.lastNameTF.helperLabel?.text = "lastName_error".localized
                registerView.lastNameTF.helperLabel?.textColor = .sysFalseTFBorder
                textField.layer.borderColor = UIColor.sysFalseTFBorder.cgColor
                
                
                let imageView = UIImageView(image: UIImage(named: "alert_image".localized)?.withRenderingMode(.alwaysTemplate))
                textField.rightView = imageView
                textField.rightView?.tintColor = .sysFalseTFBorder
            }
        case registerView.datePicker.datePickerViewYear.selectedYearText:
            if let text = textField.text {
                if viewModel!.validator.isValidYear(year: text) {
                    textField.layer.borderColor = UIColor.sysTrueTFBorder.cgColor
                } else {
                    textField.layer.borderColor = UIColor.sysFalseTFBorder.cgColor
                }
            } else {
                textField.layer.borderColor = UIColor.sysFalseTFBorder.cgColor
            }
        case registerView.datePicker.datePickerViewMonth.selectedMonthText:
            if let text = textField.text {
                if viewModel!.validator.isValidMonth(month: text) {
                    textField.layer.borderColor = UIColor.sysTrueTFBorder.cgColor
                } else {
                    textField.layer.borderColor = UIColor.sysFalseTFBorder.cgColor
                }
            } else {
                textField.layer.borderColor = UIColor.sysFalseTFBorder.cgColor
            }
            
        case registerView.datePicker.datePickerViewDay.selectedDayText:
            if let text = textField.text {
                if viewModel!.validator.isValidDay(day: text) {
                    textField.layer.borderColor = UIColor.sysTrueTFBorder.cgColor
                } else {
                    textField.layer.borderColor = UIColor.sysFalseTFBorder.cgColor
                }
            } else {
                textField.layer.borderColor = UIColor.sysFalseTFBorder.cgColor
            }
        default:
            break
        }
    }
}
