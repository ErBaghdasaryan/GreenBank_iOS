//
//  AddAccountViewModel.swift
//  GreenBank.ViewModel
//
//  Created by Er Baghdasaryan on 05.03.24.
//

import UIKit
import GreenBank_Networking

public class AddAccountViewModel: IAddAccountViewModel {
    
    public var validator: Validator
    
    public init() {
        self.validator = Validator.shared
    }
    
    public func creatAccount(ownerId: String, accountType: String, currency: String, accessToken: String) async throws -> AccountSendResponse? {
        let postData = AccountPostData(ownerId: ownerId,
                                       accountType: accountType,
                                       currency: currency)
        
        let configAccount = URLSessionConfiguration(url: "https://api-greenbank.coderepublic.am/api/accounts/",
                                                    accessToken: accessToken,
                                                    body: postData,
                                                    method: .post)
        
        do {
            return try await URLSession.shared.execute(with: configAccount, dataType: AccountSendResponse.self)
        } catch {
            print("ERROR")
        }
        return nil
    }
}
