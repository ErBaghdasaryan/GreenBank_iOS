//
//  UserRegistrationInfo.swift
//  GreenBank.ViewModel
//
//  Created by Er Baghdasaryan on 25.01.24.
//

import Foundation

public struct UserRegistrationInfo: Codable {
    public var firstName: String?
    public var lastName: String?
    public var email: String?
    public var birthday: String?
    public var password: String?
    public var phone: String?
    
    public init() {}
}
