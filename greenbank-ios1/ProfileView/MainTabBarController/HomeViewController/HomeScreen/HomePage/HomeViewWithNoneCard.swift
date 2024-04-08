//
//  HomeView.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 31.01.24.
//

import UIKit
import GreenBank_UIComponents

class HomeViewWithNoneCard: BaseHomeView {

    public let userView = UserView(username: "",
                                   welcomeText: "user_Welcome_Label".localized,
                                   userImage: UIImage(named: "jon")!)
    public let notifyButton = UIButton(type: .system)
    public var addCardView: UIView!
    public let addButton = UIButton(type: .system)
    public let addLabel = UILabel(text: "add_card_label".localized, textColor: .lightGray, font: UIFont.SFProRegular(size: 12))
    public var otherDataView: UIView!
    
    public let orLabel = UILabel(text: "or_label".localized, textColor: .black,
                                 font: .SFProRegular(size: 12))
    public let tryBalanceButton = UIButton(type: .system)
    
    private func setupUser() {
        let userInfo = AppDelegate.shared?.userRegisterInformation
        
        userView.usernameLabel.text = userInfo?.userDto.firstName
        
        //            if let userImage = userInfo?.userDto.img {
        //
        //            }
    }
    
    public override func setupUI() {
        setupUser()
        self.backgroundColor = .sysMainWhite
        
        userView.setupUI()
        customizeNotificationButton()
        customizeAddCardView()
        customizeOtherData()
        
        orLabel.textAlignment = .center
        tryBalanceButton.setTitle("try_balance_label".localized, for: .normal)
        tryBalanceButton.titleLabel?.font = .SFProBold(size: 14)
        tryBalanceButton.titleLabel?.tintColor = .black
        tryBalanceButton.titleLabel?.textAlignment = .center
        let orTryBalanceSV = UIStackView(arrangedSubviews: [orLabel, tryBalanceButton], axis: .vertical, spacing: 0)
        
        userView.translatesAutoresizingMaskIntoConstraints = false
        notifyButton.translatesAutoresizingMaskIntoConstraints = false
        addCardView.translatesAutoresizingMaskIntoConstraints = false
        orTryBalanceSV.translatesAutoresizingMaskIntoConstraints = false
        otherDataView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(userView)
        addSubview(notifyButton)
        addSubview(addCardView)
        addSubview(orTryBalanceSV)
        addSubview(otherDataView)
        
        NSLayoutConstraint.activate([
            userView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            userView.topAnchor.constraint(equalTo: self.topAnchor, constant: 61),
            userView.widthAnchor.constraint(equalToConstant: 142),
            userView.heightAnchor.constraint(equalToConstant: 39.54)
        ])
        
        NSLayoutConstraint.activate([
            notifyButton.widthAnchor.constraint(equalToConstant: 24),
            notifyButton.heightAnchor.constraint(equalToConstant: 28.8),
            notifyButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 353),
            notifyButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 67)
        ])
        
        NSLayoutConstraint.activate([
            addCardView.widthAnchor.constraint(equalToConstant: 361),
            addCardView.heightAnchor.constraint(equalToConstant: 101),
            addCardView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
            addCardView.topAnchor.constraint(equalTo: self.topAnchor, constant: 133)
        ])
        
        NSLayoutConstraint.activate([
            orTryBalanceSV.widthAnchor.constraint(equalToConstant: 285),
            orTryBalanceSV.heightAnchor.constraint(equalToConstant: 34),
            orTryBalanceSV.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 54),
            orTryBalanceSV.topAnchor.constraint(equalTo: addCardView.bottomAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            otherDataView.widthAnchor.constraint(equalToConstant: 361),
            otherDataView.heightAnchor.constraint(equalToConstant: 852),
            otherDataView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
            otherDataView.topAnchor.constraint(equalTo: self.topAnchor, constant: 350)
        ])
    }
    
    private func customizeNotificationButton() {
        notifyButton.setImage(UIImage(named: "notification_Button_image".localized)?.withRenderingMode(.alwaysTemplate), for: .normal)
        notifyButton.tintColor = .sysGlobalGreen
    }
    
    private func customizeAddCardView() {
        self.addCardView = UIView()
        
        addCardView.backgroundColor = .white
        
        addButton.setImage(UIImage(named: "green_Plus_Button".localized)?.withRenderingMode(.alwaysTemplate), for: .normal)
        addButton.tintColor = .sysGlobalGreen
        
        addLabel.textAlignment = .center
        addLabel.numberOfLines = 0
        
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addCardView.addSubview(addButton)
        addCardView.addSubview(addLabel)
        
        let layer0 = CALayer()
        layer0.shadowColor = UIColor(red: 0.208, green: 0.208, blue: 0.208, alpha: 0.45).cgColor
        layer0.shadowOpacity = 1
        layer0.shadowRadius = 10
        layer0.shadowOffset = CGSize(width: 2, height: 2)
        layer0.bounds = addCardView.bounds
        layer0.position = addCardView.center
        addCardView.layer.addSublayer(layer0)
        
        addCardView.layer.cornerRadius = 12
        addCardView.layer.borderWidth = 1
        addCardView.layer.borderColor = UIColor.sysLightGray.cgColor
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: addCardView.topAnchor, constant: 21),
            addButton.centerXAnchor.constraint(equalTo: addCardView.centerXAnchor),
            addButton.widthAnchor.constraint(equalToConstant: 19),
            addButton.heightAnchor.constraint(equalToConstant: 19)
        ])
        
        NSLayoutConstraint.activate([
            addLabel.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 12),
            addLabel.centerXAnchor.constraint(equalTo: addCardView.centerXAnchor),
            addLabel.widthAnchor.constraint(equalToConstant: 277),
            addLabel.heightAnchor.constraint(equalToConstant: 30),
        ])
        
        addShadow(to: addCardView)
    }
    
    private func customizeOtherData() {
        self.otherDataView = UIView()
        
        otherDataView.backgroundColor = .white
        
        let hiLabel = UILabel(text: "hi_label".localized, textColor: .lightGray, font: .SFProRegular(size: 14))
        let noInfoLabel = UILabel(text: "no_info_label".localized, textColor: .lightGray,
                                  font: .SFProRegular(size: 14))
        let noInfoStackView = UIStackView(arrangedSubviews: [hiLabel, noInfoLabel], axis: .vertical, spacing: 0)
        
        let seeOtherDataLabel = UILabel(text: "see_other_data_label".localized, textColor: .black, font: .SFProSemiBold(size: 18))
        let otherDataImage = UIImageView(image: UIImage(named: "other_data_Image".localized))
        
        otherDataView.layer.cornerRadius = 12
        otherDataView.layer.borderWidth = 1
        otherDataView.layer.borderColor = UIColor.sysLightGray.cgColor
        
        noInfoStackView.translatesAutoresizingMaskIntoConstraints = false
        seeOtherDataLabel.translatesAutoresizingMaskIntoConstraints = false
        otherDataImage.translatesAutoresizingMaskIntoConstraints = false
        
        otherDataView.addSubview(noInfoStackView)
        otherDataView.addSubview(seeOtherDataLabel)
        otherDataView.addSubview(otherDataImage)
        
        hiLabel.textAlignment = .center
        noInfoLabel.textAlignment = .center
        seeOtherDataLabel.textAlignment = .center
        seeOtherDataLabel.numberOfLines = 2
        
        NSLayoutConstraint.activate([
            noInfoStackView.widthAnchor.constraint(equalToConstant: 185),
            noInfoStackView.heightAnchor.constraint(equalToConstant: 37),
            noInfoStackView.centerXAnchor.constraint(equalTo: otherDataView.centerXAnchor, constant: 0),
            noInfoStackView.topAnchor.constraint(equalTo: otherDataView.topAnchor, constant: 27),
        ])
        
        NSLayoutConstraint.activate([
            seeOtherDataLabel.widthAnchor.constraint(equalToConstant: 259),
            seeOtherDataLabel.heightAnchor.constraint(equalToConstant: 44),
            seeOtherDataLabel.centerXAnchor.constraint(equalTo: otherDataView.centerXAnchor, constant: 0),
            seeOtherDataLabel.topAnchor.constraint(equalTo: noInfoStackView.bottomAnchor, constant: 42),
        ])
        
        NSLayoutConstraint.activate([
            otherDataImage.widthAnchor.constraint(equalToConstant: 149),
            otherDataImage.heightAnchor.constraint(equalToConstant: 159),
            otherDataImage.centerXAnchor.constraint(equalTo: otherDataView.centerXAnchor, constant: 0),
            otherDataImage.topAnchor.constraint(equalTo: seeOtherDataLabel.bottomAnchor, constant: 62)
        ])
        
        addShadow(to: otherDataView)
        
    }

    func addShadow(to view: UIView, color: UIColor = .sysShadowColor, opacity: Float = 0.4, radius: CGFloat = 4, offset: CGSize = CGSize(width: 2, height: 2)) {
        view.layer.shadowColor = color.cgColor
        view.layer.shadowOpacity = opacity
        view.layer.shadowRadius = radius
        view.layer.shadowOffset = offset
        view.layer.masksToBounds = false
    }
}
