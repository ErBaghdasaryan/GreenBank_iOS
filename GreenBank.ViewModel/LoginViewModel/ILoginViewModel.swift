//
//  ILoginViewModel.swift
//  GreenBank.ViewModel
//
//  Created by Hovo Ohanyan on 15.01.24.
//

import Foundation

protocol ILoginViewModel: IViewModel {
    var validator: IValidator { get }
    func getUser(withEmail email: String, withPassword password: String) async throws -> ServerResponse?
}
