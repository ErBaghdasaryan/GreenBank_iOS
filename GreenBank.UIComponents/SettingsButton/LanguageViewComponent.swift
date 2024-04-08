//
//  LanguageView.swift
//  GreenBank.UIComponents
//
//  Created by Er Baghdasaryan on 30.03.24.
//

import Foundation
import UIKit

public class LanguageViewComponent: UIView {
    
    public var settingsTypeLabel = UILabel(text: "",
                                   textColor: .sysBlack,
                                           font: .SFProRegular(size: 15))
    public let selectTypeLanguageButton = UIButton(type: .system)
    
    public init(languageName: String) {
        super.init(frame: .zero)
        self.setupViews()
        self.settingsTypeLabel.text = languageName
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupViews() {
        
        customizeSelecdCardTypeButtons()
        settingsTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        selectTypeLanguageButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(settingsTypeLabel)
        self.addSubview(selectTypeLanguageButton)

        NSLayoutConstraint.activate([
            settingsTypeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            settingsTypeLabel.widthAnchor.constraint(equalToConstant: 147),
            settingsTypeLabel.heightAnchor.constraint(equalToConstant: 21),
            settingsTypeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            selectTypeLanguageButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            selectTypeLanguageButton.widthAnchor.constraint(equalToConstant: 24),
            selectTypeLanguageButton.heightAnchor.constraint(equalToConstant: 24),
            selectTypeLanguageButton.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    public func customizeSelecdCardTypeButtons() {
        selectTypeLanguageButton.layer.cornerRadius = 12
        selectTypeLanguageButton.layer.masksToBounds = true
        selectTypeLanguageButton.layer.borderWidth = 1
        selectTypeLanguageButton.layer.borderColor = UIColor.lightGray.cgColor
        selectTypeLanguageButton.backgroundColor = .sysLanguageSelBack
    }
}
