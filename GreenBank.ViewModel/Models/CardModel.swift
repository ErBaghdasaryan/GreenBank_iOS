//
//  CardModel.swift
//  GreenBank.ViewModel
//
//  Created by Hovo Ohanyan on 06.02.24.
//

import Foundation

public struct Card: Codable {
    public let id, 
               cardName,
               cardNumber,
               cardType: String
    public let expirationDate, 
               accountNumber,
               cardHolderFullName,
               cvv: String
    public let colour: CardColorUpdate?
    public let currency: String
    public let balance: Double
}

public struct CardColorUpdate: Codable {
    public var firstHex, 
               secondHex: String
    public init(firstHex: String, secondHex: String) {
        self.firstHex = firstHex
        self.secondHex = secondHex
    }
}

public struct CardResponse: Codable {
    public let status: String
    public let value: [Card]
    public let message: String
}

public struct CardSendResponse: Codable {
    let status: String
    public let value: Card
    let message: String
}

