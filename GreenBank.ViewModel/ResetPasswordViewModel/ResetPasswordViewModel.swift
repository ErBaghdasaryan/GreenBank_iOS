//
//  ResetPasswordViewModel.swift
//  GreenBank.ViewModel
//
//  Created by Hovo Ohanyan on 25.01.24.
//

import Foundation

public class ResetPasswordViewModel: IResetPasswordViewModel {
    public var validator: IValidator
    
    public init() {
        self.validator = Validator.shared
    }
}
