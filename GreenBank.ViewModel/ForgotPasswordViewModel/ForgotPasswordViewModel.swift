//
//  ForgotPasswordViewModel.swift
//  GreenBank.ViewModel
//
//  Created by Hovo Ohanyan on 21.01.24.
//

import Foundation

public class ForgotPasswordViewModel: IForgotPasswordViewModel {
    public var validator: IValidator
    
    public init() {
        validator = Validator.shared
    }
}
