//
//  LoginViewModel.swift
//  GreenBank.ViewModel
//
//  Created by Hovo Ohanyan on 15.01.24.
//

import Foundation
import GreenBank_Networking

public class LoginViewModel: ILoginViewModel {
    public var validator: IValidator
    
    public init() {
        validator = Validator.shared
    }
    
    public func getUser(withEmail email: String, withPassword password: String) async throws -> ServerResponse? {
        let user = UserLogin(email: email, password: password)
//    http://192.168.32.128:7415/api/users/
        let urlSessionConfiguration = URLSessionConfiguration(url: "https://api-greenbank.coderepublic.am/api/auth/login",
                                                              body: user,
                                                              method: .post)
        
        do {
            return try await URLSession.shared.execute(with: urlSessionConfiguration,
                                                       dataType: ServerResponse.self)
        } catch {
            throw HTTPNetworkError.UnwrappingError
        }
    }
}

