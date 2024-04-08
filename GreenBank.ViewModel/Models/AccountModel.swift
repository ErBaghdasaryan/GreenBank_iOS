//
//  AccountModel.swift
//  GreenBank.ViewModel
//
//  Created by Er Baghdasaryan on 06.03.24.
//

import Foundation

public struct Account: Codable {
    public let id: String
    public let accountName: String
    public let accountNumber: String
    public let balance: Double
    public let currency: String
    public let accountType: String
    public let isDefault: Bool
}

public struct AccountSendResponse: Codable {
    var status: String
    public var value: Account
    var message: String
}

public struct AccountResponse: Codable {
    let status: String
    public var value: [Account]
    let message: String
}
