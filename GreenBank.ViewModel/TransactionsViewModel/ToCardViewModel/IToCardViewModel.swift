//
//  IToCardViewModel.swift
//  GreenBank.ViewModel
//
//  Created by Er Baghdasaryan on 14.03.24.
//

import Foundation

protocol IToCardViewModel: IViewModel {
    func getCards(accessToken: String, userID: String) async throws -> [Card]?
    func doTransaction(from: String, to: String, amount: Int, description: String, type: String, accessToken: String) async throws -> TransactionSendResponse?
}
