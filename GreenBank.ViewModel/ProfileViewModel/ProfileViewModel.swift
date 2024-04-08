//
//  ProfileViewModel.swift
//  GreenBank.ViewModel
//
//  Created by Er Baghdasaryan on 28.03.24.
//

import Foundation
import GreenBank_Networking
import UIKit

public class ProfileViewModel: IProfileViewModel {
    
    public var toAccountmodel = ToAccountModel()
    
    let boundary: String = "Boundary-\(UUID().uuidString)"
    
    public init() {}
    
    public func updateUser(firstName: String, lastName: String, phone: String, image: UIImage, userID: String, accessToken: String) async throws -> ServerResponseUpdate? {
        
        let body = multipartFormDataBody(boundary: boundary, firstName: firstName, lastName: lastName, phone: phone, image: image)
//        http://192.168.32.128:7415/api/users/
        let urlSessionConfig = URLSessionConfiguration(url: "http://192.168.32.128:7415/api/users/\(userID)",
                                                       accessToken: accessToken,
                                                       body: body,
                                                       method: .patch)
        do {
            return try await URLSession.shared.execute(with: urlSessionConfig,
                                                       dataType: ServerResponseUpdate.self)
        } catch {
            throw HTTPNetworkError.UnwrappingError
        }
    }
    
    public func generateRequest(httpBody: Data, userID: String, accessToken: String) -> URLRequest {
        //https://api-greenbank.coderepublic.am/api/users/
        let url = URL(string: "http://192.168.32.128:7415/api/users/\(userID)")!
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.httpBody = httpBody
        request.setValue("multipart/form-data; boundary=" + self.boundary, forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        return request
    }
    
    public func multipartFormDataBody(boundary: String, firstName: String, lastName: String, phone: String, image: UIImage) -> Data {
        
        let lineBreak = "\r\n"
        var body = Data()
        
        body.append("--\(boundary + lineBreak)")
        body.append("Content-Disposition: form-data; name=\"firstName\"\(lineBreak + lineBreak)\(firstName + lineBreak)")
        body.append("\(boundary + lineBreak)")
        
        
        body.append("--\(boundary + lineBreak)")
        body.append("Content-Disposition: form-data; name=\"lastName\"\(lineBreak + lineBreak)\(lastName + lineBreak)")
        body.append("\(boundary + lineBreak)")
        
        body.append("--\(boundary + lineBreak)")
        body.append("Content-Disposition: form-data; name=\"phone\"\(lineBreak + lineBreak)\(phone + lineBreak)")
        body.append("\(boundary + lineBreak)")
        
        body.append("--\(boundary + lineBreak)")
        body.append("Content-Disposition: form-data; image=\"imageUploads\"; image=\"\(image).jpg\"\(lineBreak)")
        //        body.append("Content-Disposition: form-data; name=\"image\"; filename=\"image.jpg\"\(lineBreak)")
        body.append("Content-Type: image/jpeg\(image).jpg\\(lineBreak)")
        body.append("Content-Type: image/jpeg\(lineBreak + lineBreak)")
        body.append(image.jpegData(compressionQuality: 0.99)!)
        body.append(lineBreak)
        
//        body.append("--\(boundary + lineBreak)" + "Content-Disposition: form-data; name=\"firstName\"\(lineBreak + lineBreak)asfafa\(lineBreak)")
        
        
        body.append("--\(boundary)--\(lineBreak)")
        return body as Data
    }
    
    
}
