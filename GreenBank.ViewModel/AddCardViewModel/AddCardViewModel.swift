//
//  AddCardViewModel.swift
//  GreenBank.ViewModel
//
//  Created by Er Baghdasaryan on 12.02.24.
//

import Foundation
import GreenBank_Networking

public class AddCardViewModel: IAddCardViewModel {
    
    public var validator: Validator
    public var addCardModel = AddedCardModel()
    
    public init() {
        self.validator = Validator.shared
    }
    
    public func creatCard(ownerId: String, cardType: String, currency: String, firstHex: String, secondHex: String, accessToken: String) async throws -> CardSendResponse? {
        
        let cardColors = CardColors(firstHex: firstHex, secondHex: secondHex)
        let postData = CardPostData(ownerId: ownerId, cardType: cardType, currency: currency, colour: cardColors)
        
        let configCard = URLSessionConfiguration(url: "https://api-greenbank.coderepublic.am/api/cards/",
                                                 accessToken: accessToken,
                                                 body: postData,
                                                 method: .post)
        
        do {
            return try await URLSession.shared.execute(with: configCard, dataType: CardSendResponse.self)
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
    
    public func getUser(accessToken: String, userID: String) async throws -> ServerResponseUpdate? {
        
        let configUser = URLSessionConfiguration(url: "https://api-greenbank.coderepublic.am/api/users/\(userID)",
                                                 accessToken: accessToken,
                                                 method: .get)
        do {
            return try await URLSession.shared.execute(with: configUser, dataType: ServerResponseUpdate.self)
        } catch {
            print(error.localizedDescription)
        }
        return nil
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
