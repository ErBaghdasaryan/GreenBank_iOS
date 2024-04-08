//
//  AccountPostData.swift
//  GreenBank.ViewModel
//
//  Created by Er Baghdasaryan on 06.03.24.
//

import Foundation

struct AccountPostData: Codable {
    let ownerId: String
    let accountType: String
    let currency: String
}
