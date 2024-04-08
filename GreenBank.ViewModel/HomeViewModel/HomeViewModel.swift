//
//  HomeViewModel.swift
//  GreenBank.ViewModel
//
//  Created by Hovo Ohanyan on 09.02.24.
//

import Foundation
import GreenBank_Networking

public class HomeViewModel: IHomeViewModel {
    public init() {
        
    }
    
    public func getCards(accessToken: String, userID: String) async throws -> [Card]? {
        
        let urlSessionConfig = URLSessionConfiguration(url: "https://api-greenbank.coderepublic.am/api/cards/all/\(userID)",
                                                       accessToken: accessToken,
                                                       method: .get)
        let cardResponse = try await URLSession.shared.execute(with: urlSessionConfig, dataType: CardResponse.self)
        return cardResponse?.value
    }
    
    public func getAccounts(accessToken: String, userID: String) async throws -> [Account]? {
        let urlSessionConfig = URLSessionConfiguration(url: "https://api-greenbank.coderepublic.am/api/accounts/all/\(userID)",
                                                       accessToken: accessToken,
                                                       method: .get)
        
        let accountResponse = try await URLSession.shared.execute(with: urlSessionConfig, dataType: AccountResponse.self)
        return accountResponse?.value
    }
}
