//
//  RegisterViewModel.swift
//  GreenBank.ViewModel
//
//  Created by Er Baghdasaryan on 25.01.24.
//

import Foundation
import GreenBank_Networking

public class RegisterViewModel: IRegisterViewModel {
    public var validator: Validator
    
    public init() {
        self.validator = Validator.shared
    }
    
    public func postUser(_ userRegisterInformation: UserRegistrationInfo) async throws {
        let urlSessionConfiguration = URLSessionConfiguration(url: "https://api-greenbank.coderepublic.am/api/auth/register",
                                                              body: userRegisterInformation,
                                                              method: .post)
        
        let userRegInfo: UserRegistationGetInfo
        
        do {
            userRegInfo = try await URLSession.shared.execute(with: urlSessionConfiguration,
                                                              dataType: UserRegistationGetInfo.self)!
            UserDefaults.standard.setValue(userRegInfo.value.userId, forKey: "userId")
        } catch {
            
        }
        
    }
}
