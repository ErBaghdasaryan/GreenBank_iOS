//
//  IRegisterViewModel.swift
//  GreenBank.ViewModel
//
//  Created by Er Baghdasaryan on 25.01.24.
//

import Foundation

public protocol IRegisterViewModel: IViewModel {
    var validator: Validator { get }
    func postUser(_ userRegisterInformation: UserRegistrationInfo) async throws
}
