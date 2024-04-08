//
//  UserView.swift
//  GreenBank.UIComponents
//
//  Created by Er Baghdasaryan on 03.02.24.
//

import UIKit

public class UserView: UIView {
    
    public var userPhoto = UIImageView()
    public var usernameLabel = UILabel()
    public var welcomeTextLabel = UILabel()
    
    public init(username: String, welcomeText: String, userImage: UIImage) {
        super.init(frame: .zero)
        self.userPhoto.image = userImage
        self.usernameLabel.text = username
        self.welcomeTextLabel.text = welcomeText
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        userPhoto.layer.masksToBounds = true
        userPhoto.layer.cornerRadius = userPhoto.frame.width / 2
        userPhoto.layer.borderColor = UIColor.sysGlobalGreen.cgColor
        userPhoto.layer.borderWidth = 2
    }
    
    public func setupUI() {
        
        userPhoto.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeTextLabel.translatesAutoresizingMaskIntoConstraints = false
        
        usernameLabel.textColor = .black
        usernameLabel.font = UIFont.SFProSemiBold(size: 18)
        welcomeTextLabel.textColor = .black
        welcomeTextLabel.font = UIFont.SFProRegular(size: 14)
        
        addSubview(userPhoto)
        addSubview(usernameLabel)
        addSubview(welcomeTextLabel)
        
        NSLayoutConstraint.activate([
            userPhoto.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            userPhoto.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            userPhoto.widthAnchor.constraint(equalToConstant: 40),
            userPhoto.heightAnchor.constraint(equalToConstant: 39.54)
        ])
        
        NSLayoutConstraint.activate([
            usernameLabel.leadingAnchor.constraint(equalTo: userPhoto.trailingAnchor, constant: 8),
            usernameLabel.topAnchor.constraint(equalTo: self.topAnchor),
        ])
        
        NSLayoutConstraint.activate([
            welcomeTextLabel.leadingAnchor.constraint(equalTo: usernameLabel.leadingAnchor),
            welcomeTextLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
        
        self.bottomAnchor.constraint(equalTo: userPhoto.bottomAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: welcomeTextLabel.trailingAnchor).isActive = true
        
        
    }
}
