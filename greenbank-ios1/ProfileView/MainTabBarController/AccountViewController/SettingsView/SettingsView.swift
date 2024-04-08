//
//  SettingsView.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 29.03.24.
//

import UIKit
import GreenBank_UIComponents

class SettingsView: UIView {

    public let navigationBar = NavigationBar(titleText: "settingsScreen_header".localized)
    public let profileSettings = ButtonFormView(imageName: "profileSettingsImagee".localized,
                                                settingType: "profileSettings".localized)
    public let notificationsSettings = ButtonFormView(imageName: "notificationsSettingsImage".localized, settingType: "notificationsSettings".localized, isToggle: true)
    public let languageSettings = ButtonFormView(imageName: "languageSettingsImage".localized,
                                                 settingType: "languageSettings".localized)
    public let securitySettings = ButtonFormView(imageName: "securitySettingsImage".localized,
                                                 settingType: "securitySettings".localized)
    public let themeSettings = ButtonFormView(imageName: "themeSettingsImage" .localized,
                                              settingType: "themeSettings".localized, isToggle: true)
    public let helpSupportSettings = ButtonFormView(imageName: "helpSupportSettingsImage".localized,
                                                    settingType: "helpSupportSettings".localized)
    public let privacyPoliceSettings = ButtonFormView(imageName: "privacyPoliceSettingsImage".localized,
                                                      settingType: "privacyPoliceSettings".localized)

    public func setupUI() {
        
        self.backgroundColor = .sysMainWhite
        
        let infoViewsStackView = UIStackView(arrangedSubviews: [profileSettings,
                                                                notificationsSettings,
                                                                languageSettings,
                                                                securitySettings,
                                                                themeSettings,
                                                                helpSupportSettings,
                                                                privacyPoliceSettings],
                                             axis: .vertical,
                                             spacing: 12)
        
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        infoViewsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        navigationBar.setupConstraints()
        navigationBar.greenView.isHidden = true

        addSubview(navigationBar)
        addSubview(infoViewsStackView)
        
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: self.topAnchor, constant: 65),
            navigationBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            navigationBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            navigationBar.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            infoViewsStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 135),
            infoViewsStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            infoViewsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            infoViewsStackView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -377)
        ])
    }
}

