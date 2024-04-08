//
//  ProfileViewControllerExtension.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 28.03.24.
//

import UIKit

extension ProfileViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true)
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        profileView.userPhotoView.userPhoto.image = image
        profileView.userPhotoView.userPhoto.contentMode = .scaleAspectFill
    }
}
