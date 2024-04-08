//
//  LanguageView.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 30.03.24.
//

import UIKit
import GreenBank_UIComponents

class LanguageView: UIView {

    public let navigationBar = NavigationBar(titleText: "languageSettings".localized)
    
    public let headerLabel = UILabel(text: "language_header".localized,
                                     textColor: .black,
                                     font: .SFProSemiBold(size: 16))
    
    public let armenianLanguage = LanguageViewComponent(languageName: "armenianLanguage_Text".localized)
    public let russianLanguage = LanguageViewComponent(languageName: "russianLanguage_Text".localized)
    public let englishLanguage = LanguageViewComponent(languageName: "englishLanguage_Text".localized)

    public func setupUI() {
        
        self.backgroundColor = .sysMainWhite
        
        let infoViewsStackView = UIStackView(arrangedSubviews: [armenianLanguage,
                                                                russianLanguage,
                                                                englishLanguage],
                                             axis: .vertical,
                                             spacing: 30)

        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        infoViewsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        navigationBar.setupConstraints()
        navigationBar.greenView.isHidden = true

        addSubview(navigationBar)
        addSubview(headerLabel)
        addSubview(infoViewsStackView)
        
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: self.topAnchor, constant: 65),
            navigationBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            navigationBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            navigationBar.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 130),
            headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 17),
            headerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -220),
            headerLabel.heightAnchor.constraint(equalToConstant: 19)
        ])
        
        NSLayoutConstraint.activate([
            infoViewsStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 170),
            infoViewsStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            infoViewsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -19),
            infoViewsStackView.heightAnchor.constraint(equalToConstant: 80)
        ])

    }
}
