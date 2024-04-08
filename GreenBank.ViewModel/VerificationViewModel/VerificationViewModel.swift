//
//  VerificationViewModel.swift
//  GreenBank.ViewModel
//
//  Created by Hovo Ohanyan on 05.02.24.
//

import Foundation
import GreenBank_Networking

public struct VerificationViewModel: IVerificationViewModel {
    public init() { }
    
    public func sendUserNumber(number: String) {
        let userId = UserDefaults.standard.string(forKey: "userId")
        
        let userVerification = UserVerification(userId: userId ?? "", number: number)
        print(userVerification)
        let urlSessionConfig = URLSessionConfiguration(url: "https://api-greenbank.coderepublic.am/api/auth/verifyNumber",
                                                       body: userVerification,
                                                       method: .post)
        
        Task {
            do {
                try await URLSession.shared.execute(with: urlSessionConfig,
                                                    dataType: UserVerification.self)
            }
        }
    }
}
