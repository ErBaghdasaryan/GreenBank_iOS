//
//  UserVerificationInfo.swift
//  GreenBank.ViewModel
//
//  Created by Hovo Ohanyan on 05.02.24.
//

import Foundation

public struct UserRegistationGetInfo: Codable {
    var status: String
    var value: RegisterInfo
    var message: String
}

struct RegisterInfo: Codable {
    var userId: String
}
