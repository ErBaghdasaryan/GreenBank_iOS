//
//  DataExtension.swift
//  GreenBank.ViewModel
//
//  Created by Er Baghdasaryan on 29.03.24.
//

import Foundation

extension Data {
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            self.append(data)
        }
    }
}
