//
//  ProfileUserVIew.swift
//  GreenBank.UIComponents
//
//  Created by Er Baghdasaryan on 21.03.24.
//

import UIKit

public class ProfileUserView: UIView {
    
    public var userPhoto = UIImageView()
    public var changePhotoButton = UIButton(type: .system)
    
    public init(userImage: UIImage, hideChangeButton: Bool) {
        super.init(frame: .zero)
        self.userPhoto.image = userImage
        if hideChangeButton {
            changePhotoButton.isHidden = true
        }
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        userPhoto.layer.masksToBounds = true
        userPhoto.layer.cornerRadius = userPhoto.frame.size.width / 2
        userPhoto.layer.borderColor = UIColor.sysGlobalGreen.cgColor
        userPhoto.layer.borderWidth = 2
    }
    
    public func setupUI() {
        
        userPhoto.translatesAutoresizingMaskIntoConstraints = false
        changePhotoButton.translatesAutoresizingMaskIntoConstraints = false
        
        changePhotoButton.setImage(UIImage(named: "editProfilePicture_Image".localized),
                                   for: .normal)
        
        addSubview(userPhoto)
        addSubview(changePhotoButton)
        
        NSLayoutConstraint.activate([
            userPhoto.topAnchor.constraint(equalTo: self.topAnchor),
            userPhoto.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            userPhoto.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            userPhoto.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            changePhotoButton.heightAnchor.constraint(equalToConstant: 33),
            changePhotoButton.trailingAnchor.constraint(equalTo: userPhoto.trailingAnchor, constant: -14.67),
            changePhotoButton.topAnchor.constraint(equalTo: userPhoto.topAnchor, constant: 116),
        ])
    }
}

