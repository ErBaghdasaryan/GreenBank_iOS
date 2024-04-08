//
//  CardPostData.swift
//  GreenBank.ViewModel
//
//  Created by Er Baghdasaryan on 12.02.24.
//

import Foundation

struct CardPostData: Codable {
    let ownerId: String
    let cardType: String
    let currency: String
    let colour: CardColors
}

struct CardColors: Codable {
    public var firstHex,
               secondHex: String
}
