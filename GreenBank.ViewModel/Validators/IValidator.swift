//
//  IValidator.swift
//  GreenBank.ViewModel
//
//  Created by Hovo Ohanyan on 22.01.24.
//

import Foundation

public protocol IValidator {
    func isFilled(email: String?, password: String?, confirmPassword: String?) -> Bool
    func validationForUserRegistrationData(email: String, password: String, confirmPassword: String) -> Bool
    func emailValidation(email: String) -> Bool
    func passwordValidation(password: String) -> Bool
    func confirmPasswordValidation(password: String, confirmPassword: String) -> Bool
    func isValidArmenianPhoneNumber(phoneNumber: String) -> Bool
    func isValidFirstName(firstName: String) -> Bool
    func isValidLastName(lastName: String) -> Bool
    func isValidDay(day: String) -> Bool
    func isValidMonth(month: String) -> Bool
    func isValidYear(year: String) -> Bool
    func isValidDateOfBirth(day: String, month: String, year: String) -> Bool
    func isCardHolderNameValid(name: String) -> Bool
    func isCardCurrencyValid(currency: String) -> Bool
    func isCreditCardValid(creditCard: String) -> Bool
    func isAmountValid(amount: String) -> Bool
    func isMessageValid(message: String) -> Bool
    func isAccountNumberValid(accountNumber: String) -> Bool
    func validateAndFormatArmenianPhoneNumber(_ phoneNumber: String) -> String?
}
