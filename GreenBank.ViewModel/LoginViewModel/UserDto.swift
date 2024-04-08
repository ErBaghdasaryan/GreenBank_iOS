//
//  UserDto.swift
//  GreenBank.ViewModel
//
//  Created by Hovo Ohanyan on 25.01.24.
//

import Foundation

public struct ServerResponse: Codable {
    var status: String
    public var value: AccountData
    var message: String
}

public struct AccountData: Codable {
    public var refreshToken: String
    public var accessToken: String
    public var userDto: UserDto
}

public struct UserDto: Codable {
    public let id: String
    public let firstName: String
    public let lastName: String
    public let email: String
    public let birthday: String
    public let phone: String
    public let img: String? //MARK: Maybe there is problem
    public let role: String
    public var accounts: [String]
    public var cards: [String]
}

public struct ServerResponseUpdate: Codable {
    var status: String
    public var value: UserDto
    var message: String
}

public struct UserUpdateDto: Codable {
    public let id: String
    public let firstName: String
    public let lastName: String
    public let email: String
    public let birthday: String
    public let password: String
    public let phone: String
    public let img: String
    public let accounts: [String]
    public let cards: [String]
}

