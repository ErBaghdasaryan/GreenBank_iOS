//
//  IProfileViewModel.swift
//  GreenBank.ViewModel
//
//  Created by Er Baghdasaryan on 28.03.24.
//

import Foundation
import UIKit.UIImage

protocol IProfileViewModel: IViewModel {
    func updateUser(firstName: String, lastName: String, phone: String, image: UIImage, userID: String, accessToken: String) async throws -> ServerResponseUpdate?
}
