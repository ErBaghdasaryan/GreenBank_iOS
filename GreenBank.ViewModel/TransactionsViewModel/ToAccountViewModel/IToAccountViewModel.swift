//
//  IToAccountViewModel.swift
//  GreenBank.ViewModel
//
//  Created by Er Baghdasaryan on 19.03.24.
//

import Foundation

protocol IToAccountViewModel: IViewModel {
    func doTransaction(from: String, to: String, amount: Int, description: String, type: String, accessToken: String) async throws -> TransactionSendResponse?
}
