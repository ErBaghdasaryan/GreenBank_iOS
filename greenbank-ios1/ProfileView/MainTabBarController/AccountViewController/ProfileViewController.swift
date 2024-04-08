//
//  AccountViewController.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 31.01.24.
//

import UIKit
import GreenBank_ViewModel

final class ProfileViewController: BaseViewController<ProfileViewModel> {
    
    public let profileView = ProfileView()
    let boundary: String = "Boundary-\(UUID().uuidString)"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        makeButtonActions()
        setUpViewModel()
    }
    
    private func setupUI() {
        profileView.frame = view.bounds
        profileView.navigationBar.backButton.isHidden = true
        profileView.setupUI()
        view.addSubview(profileView)
    }
    
    private func setUpViewModel() {
        self.viewModel = ProfileViewModel()
    }
    
    private func makeButtonActions() {
        let setPhoto = UIAction { _ in
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true)
        }
        
        let settingsAction = UIAction { _ in
            let nextVC = SettingsViewController()
            nextVC.modalPresentationStyle = .fullScreen
            self.present(nextVC, animated: true)
        }
        
        let submitAction = UIAction { _ in
            guard let firstName = self.profileView.firstNameView.rightText.text else { return }
            guard let lastname = self.profileView.lastNameView.rightText.text else { return }
            guard let mobile = self.profileView.mobileView.rightText.text else { return }
            guard self.viewModel != nil else { return }
            guard let appDelegate = AppDelegate.shared else { return }
            guard let image = self.profileView.userPhotoView.userPhoto.image else { fatalError() }
            guard let ownerID = appDelegate.userRegisterInformation?.userDto.id else { fatalError() }
            guard let accessToken = appDelegate.userRegisterInformation?.accessToken else { fatalError() }
            //MARK: To do change, passing from FormData
//            Task {
//                do {
//                    if let accessToken = appDelegate.userRegisterInformation?.accessToken,
//                       let ownerId = appDelegate.userRegisterInformation?.userDto.id {
//                        
//                        let data = try await self.viewModel?.updateUser(firstName: firstName,
//                                                         lastName: lastname,
//                                                         phone: mobile,
//                                                                        image: image,
//                                                         userID: ownerId,
//                                                                        accessToken: accessToken)?.value
////                        appDelegate.userRegisterInformation?.userDto = data
////                        appDelegate.userRegisterInformation?.userDto = data!
////                        mainTabBar.
//                    }
//                } catch {
//                    
//                }
//            }
            let requestBody = self.viewModel?.multipartFormDataBody(boundary: self.boundary, firstName: firstName, lastName: lastname, phone: mobile, image: image)
            print("SAAAAAAAAAAAAAAAAAAA")
            print(requestBody!)
            let request = self.viewModel?.generateRequest(httpBody: requestBody!, userID: ownerID, accessToken: accessToken)
            print("SAAAAAAAAAAAAAAAAAAA")
            print(request!)
            URLSession.shared.dataTask(with: request!) { data, response, error in
                if let error = error {
                    print("--------->>>>>>>>><<<<<<__-----------")
                    print("-------------ERORR--------------------")
                }
                
                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        print(json)
                    } catch {
                        print(error)
                    }
                }
                print("--------->>>>>>>>><<<<<<__-----------")
                print("-------------Success--------------------")
                
            }.resume()
        }
        
        self.profileView.userPhotoView.changePhotoButton.addAction(setPhoto, for: .touchUpInside)
        self.profileView.submitButton.addAction(submitAction, for: .touchUpInside)
        self.profileView.settingsButton.addAction(settingsAction, for: .touchUpInside)
    }
    
    private func updateUI(firstName: String, lastName: String, email: String, phoneNumber: String) {
        self.profileView.userNameLabel.text = "\(firstName) \(lastName)"
        self.profileView.mailAndNumberLabel.text = "\(email) | \(phoneNumber)"
    }
}
