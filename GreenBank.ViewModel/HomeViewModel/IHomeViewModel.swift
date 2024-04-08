//
//  IHomeViewModel.swift
//  GreenBank.ViewModel
//
//  Created by Hovo Ohanyan on 09.02.24.
//

import Foundation

protocol IHomeViewModel: IViewModel {
    func getCards(accessToken: String, userID: String) async throws -> [Card]?
    func getAccounts(accessToken: String, userID: String) async throws -> [Account]?
}
