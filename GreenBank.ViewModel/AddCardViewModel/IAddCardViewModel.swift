//
//  IAddCardViewModel.swift
//  GreenBank.ViewModel
//
//  Created by Er Baghdasaryan on 12.02.24.
//

import Foundation

public protocol IAddCardViewModel: IViewModel {
//    var validator: IValidator { get }
    
    func creatCard(ownerId: String, cardType: String, currency: String, firstHex: String, secondHex: String, accessToken: String) async throws -> CardSendResponse?
    func getUser(accessToken: String, userID: String) async throws -> ServerResponseUpdate? 
}
