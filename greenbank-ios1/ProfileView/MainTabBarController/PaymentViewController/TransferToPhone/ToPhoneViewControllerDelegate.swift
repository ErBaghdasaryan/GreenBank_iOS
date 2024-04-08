//
//  ToPhoneViewControllerDelegate.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 03.04.24.
//

import UIKit
import ContactsUI

extension ToPhoneViewController: CNContactPickerDelegate {
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        picker.dismiss(animated: true) {
            self.showAlert(contact: contact)
        }
    }
    
    func showAlert(contact: CNContact) {
        guard contact.phoneNumbers.count > 1 else {
            if let phoneNumber = contact.phoneNumbers.first?.value.stringValue {
                self.toPhoneView.creditPhoneTextField.textField.text = phoneNumber
            }
            return
        }
        
        let alertController = UIAlertController(title: "Select a Number", message: nil, preferredStyle: .actionSheet)
        
        for number in contact.phoneNumbers {
            let action = UIAlertAction(title: number.value.stringValue, style: .default) { _ in
                self.toPhoneView.creditPhoneTextField.textField.text = number.value.stringValue
            }
            alertController.addAction(action)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
}
