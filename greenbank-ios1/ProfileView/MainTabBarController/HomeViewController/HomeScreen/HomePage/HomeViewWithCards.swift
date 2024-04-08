//
//  HomeViewWithCards.swift
//  greenbank-ios1
//
//  Created by Hovo Ohanyan on 09.02.24.
//

import UIKit
import GreenBank_UIComponents

final class HomeViewWithCard: BaseHomeView {
    public let userView = UserView(username: "",
                                   welcomeText: "user_Welcome_Label".localized,
                                   userImage: UIImage(named: "jon")!)
    
    var collectionViewForCard: UICollectionView!
    var tableViewForAccount: UITableView!
    
    public let notifyButton = UIButton(type: .system)
    
    var activityIndicartor: UIActivityIndicatorView = {
        let active = UIActivityIndicatorView()
        active.color = .sysGlobalGreen
        return active
    }()
    
    private func setupUser() {
            let userInfo = AppDelegate.shared?.userRegisterInformation
            
            userView.usernameLabel.text = userInfo?.userDto.firstName
            
//            if let userImage = userInfo?.userDto.img {
//
//            } //MARK: Setup image
    }
    
    override func setupUI() {
        customizeNotificationButton()
        setupUser()
        setupCollectionViewForCards()
        setupTableViewForAccount()
        
        self.backgroundColor = .sysMainWhite
        collectionViewForCard.backgroundColor = .sysMainWhite
        
        userView.setupUI()
        
        notifyButton.translatesAutoresizingMaskIntoConstraints = false
        userView.translatesAutoresizingMaskIntoConstraints = false
        collectionViewForCard.translatesAutoresizingMaskIntoConstraints = false
        tableViewForAccount.translatesAutoresizingMaskIntoConstraints = false
        activityIndicartor.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(notifyButton)
        self.addSubview(userView)
        self.addSubview(collectionViewForCard)
        self.addSubview(tableViewForAccount)

        self.addSubview(activityIndicartor)
        
        makeAutoLayout()
    }
    
    private func makeAutoLayout() {
        NSLayoutConstraint.activate([
            userView.topAnchor.constraint(equalTo: self.topAnchor, constant: 61),
            userView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            userView.widthAnchor.constraint(equalToConstant: 190),
            userView.heightAnchor.constraint(equalToConstant: 39.54)
        ])
        
        NSLayoutConstraint.activate([
            notifyButton.widthAnchor.constraint(equalToConstant: 24),
            notifyButton.heightAnchor.constraint(equalToConstant: 28.8),
            notifyButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            notifyButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 67)
        ])
        
        NSLayoutConstraint.activate([
            collectionViewForCard.topAnchor.constraint(equalTo: self.topAnchor, constant: 178),
            collectionViewForCard.leftAnchor.constraint(equalTo: self.leftAnchor),
            collectionViewForCard.rightAnchor.constraint(equalTo: self.rightAnchor),
            collectionViewForCard.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -480)
        ])
        
        NSLayoutConstraint.activate([
            activityIndicartor.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            activityIndicartor.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])

        NSLayoutConstraint.activate([
            tableViewForAccount.topAnchor.constraint(equalTo: collectionViewForCard.bottomAnchor, constant: 34),
            tableViewForAccount.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 18),
            tableViewForAccount.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -17),
            tableViewForAccount.bottomAnchor.constraint(greaterThanOrEqualTo: self.bottomAnchor, constant: -121)
        ])
    }
    
    private func setupCollectionViewForCards() {
        let layout = UPCarouselFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 246, height: 154)
        layout.minimumInteritemSpacing = 5
        
        collectionViewForCard = UICollectionView(frame: .zero, collectionViewLayout: layout)

        collectionViewForCard.showsHorizontalScrollIndicator = false
    }
    
    private func setupTableViewForAccount() {
        tableViewForAccount = UITableView(frame: .zero, style: .plain)
        tableViewForAccount.separatorStyle = .singleLine
        tableViewForAccount.layer.cornerRadius = 20
        tableViewForAccount.showsVerticalScrollIndicator = false
    }
    
    private func customizeNotificationButton() {
        notifyButton.setImage(UIImage(named: "notification_Button_image".localized)?.withRenderingMode(.alwaysTemplate), for: .normal)
        notifyButton.tintColor = .sysGlobalGreen
    }
}
