//
//  ToAccountViewModel.swift
//  GreenBank.ViewModel
//
//  Created by Er Baghdasaryan on 19.03.24.
//

import Foundation
import GreenBank_Networking

public class ToAccountViewModel: IToAccountViewModel {
    
    public var validator: IValidator
    public var toAccountmodel = ToAccountModel()
    
    public init() {
        validator = Validator.shared
    }
    
    public func doTransaction(from: String, to: String, amount: Int, description: String, type: String, accessToken: String) async throws -> TransactionSendResponse? {
        
        let body = TransactionSendData(from: from,
                                       to: to,
                                       amount: amount,
                                       description: description,
                                       type: type)
        
        let doTransaction = URLSessionConfiguration(url: "https://api-greenbank.coderepublic.am/api/transactions",
                                                 accessToken: accessToken,
                                                 body: body,
                                                 method: .post)
        
        do {
            return try await URLSession.shared.execute(with: doTransaction, dataType: TransactionSendResponse.self)
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}
