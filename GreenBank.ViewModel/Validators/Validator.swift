//
//  Validator.swift
//  GreenBank.ViewModel
//
//  Created by Hovo Ohanyan on 22.01.24.
//

import Foundation

public class Validator: IValidator {
    static let shared = Validator()
    
    private init() { }
    
    public func isFilled(email: String?, password: String?, confirmPassword: String?) -> Bool {
        guard email != nil,
              password != nil,
              confirmPassword != nil else { return false }
        
        if ((email?.isEmpty) != nil) || ((password?.isEmpty) != nil) || ((confirmPassword?.isEmpty) != nil) {
            return false
        }
        
        return true
    }
    
    public func validationForUserRegistrationData(email: String, password: String, confirmPassword: String) -> Bool {
        if emailValidation(email: email) && passwordValidation(password: password) &&
            confirmPasswordValidation(password: password, confirmPassword: confirmPassword) {
            return true
        }
        
        return false
    }
    
    public func emailValidation(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        if emailPredicate.evaluate(with: email) {
            return true
        } else {
            return false
        }
    }
    
    public func passwordValidation(password: String) -> Bool {
        let passwordRegex = "^(?=.*[A-Z])[A-Za-z\\d@$!%*?&#]{8,}$"
           let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
           return passwordTest.evaluate(with: password)
    }
    
    public func confirmPasswordValidation(password: String, confirmPassword: String) -> Bool {
        if password == confirmPassword && !confirmPassword.isEmpty {
            return true
        }
        
        return false
    }
    
    public func isValidArmenianPhoneNumber(phoneNumber: String) -> Bool {
        let phoneRegex = #"^\+\d{11}$"#

        let regex = try! NSRegularExpression(pattern: phoneRegex, options: [])

        let range = NSRange(location: 0, length: phoneNumber.utf16.count)
        let isValid = regex.firstMatch(in: phoneNumber, options: [], range: range) != nil

        return isValid
    }
    
    public func isValidFirstName(firstName: String) -> Bool {
        let nameRegex = #"^[A-Z][a-z]{2,}$"#
        
        do {
            let regex = try NSRegularExpression(pattern: nameRegex, options: [])
            return regex.firstMatch(in: firstName, options: [], range: NSRange(location: 0, length: firstName.utf16.count)) != nil
        } catch {
            print("Invalid regular expression: \(error)")
            return false
        }
    }
    
    public func isValidLastName(lastName: String) -> Bool {
        let nameRegex = #"^[A-Z][a-z]{2,}$"#
        
        do {
            let regex = try NSRegularExpression(pattern: nameRegex, options: [])
            return regex.firstMatch(in: lastName, options: [], range: NSRange(location: 0, length: lastName.utf16.count)) != nil
        } catch {
            print("Invalid regular expression: \(error)")
            return false
        }
    }
    
    public func isValidDay(day: String) -> Bool {
        let dayRegex = #"^([1-9]|[12][0-9]|3[01])$"#
        let dayRegexObj = try! NSRegularExpression(pattern: dayRegex, options: [])
        return dayRegexObj.firstMatch(in: day, options: [], range: NSRange(location: 0, length: day.utf16.count)) != nil
    }
    
    public func isValidMonth(month: String) -> Bool {
        let monthRegex = #"^(0[1-9]|1[0-2])$"#
        let monthRegexObj = try! NSRegularExpression(pattern: monthRegex, options: [])
        return monthRegexObj.firstMatch(in: month, options: [], range: NSRange(location: 0, length: month.utf16.count)) != nil
    }
    
    public func isValidYear(year: String) -> Bool {
        let yearRegex = #"^\d{4}$"#
        let yearRegexObj = try! NSRegularExpression(pattern: yearRegex, options: [])
        return yearRegexObj.firstMatch(in: year, options: [], range: NSRange(location: 0, length: year.utf16.count)) != nil
    }
    
    public func isValidDateOfBirth(day: String, month: String, year: String) -> Bool {
        return isValidDay(day: day) && isValidMonth(month: month) && isValidYear(year: year)
    }
    
    public func isCardHolderNameValid(name: String) -> Bool {
        guard !name.isEmpty else { return false }
        guard name.count >= 10 else { return false }
        guard name.contains(" ") else { return false }
        for character in name {
            if character.isLowercase {
                return false
            }
        }
        
        return true
    }
    
    public func isCardCurrencyValid(currency: String) -> Bool {
        let validCurrencies = ["USD", "EUR", "GBP"]
        return validCurrencies.contains(currency.uppercased())
    }
    
    public func isCreditCardValid(creditCard: String) -> Bool {
        guard !creditCard.isEmpty else {
            return false
        }

        let digits = CharacterSet.decimalDigits
        guard creditCard.rangeOfCharacter(from: digits.inverted) == nil else {
            return false
        }
        
        let fixedLength = 16
        return creditCard.count == fixedLength
    }
    
    public func isAmountValid(amount: String) -> Bool {
        guard !amount.isEmpty, let _ = Double(amount) else {
            return false
        }
        return true
    }
    
    public func isMessageValid(message: String) -> Bool {
        return !message.isEmpty && message.count >= 10
    }
    
    public func isAccountNumberValid(accountNumber: String) -> Bool {
        guard !accountNumber.isEmpty else {
            return false
        }
        
        let digits = CharacterSet.decimalDigits
        guard accountNumber.rangeOfCharacter(from: digits.inverted) == nil else {
            return false
        }
        return true
    }
    
    public func validateAndFormatArmenianPhoneNumber(_ phoneNumber: String) -> String? {
        
        let digitsOnly = phoneNumber.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        
        if digitsOnly.hasPrefix("0") {
            return "+374" + String(digitsOnly.dropFirst())
        }
        
        if digitsOnly.hasPrefix("+374") {
            guard digitsOnly.count == 12 else {
                return nil
            }
            
            return digitsOnly
        }
        
        return nil
    }
}
