//
//  TransactionSendData.swift
//  GreenBank.ViewModel
//
//  Created by Er Baghdasaryan on 01.04.24.
//

import Foundation

public struct TransactionSendData: Codable {
    let from,
        to: String
    let amount: Int
    let description, 
        type: String
}

public struct TransactionSendResponse: Codable {
    let status: String
    let value: Transaction
    let message: String
}

public struct Transaction: Codable {
    let id: String
    let from, 
        to: InfoTransaction
    let amount: Int
    let description, date: String
    let done: Bool
}

public struct InfoTransaction: Codable {
    let number, type: String
}
