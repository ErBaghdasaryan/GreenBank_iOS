//
//  StringExtension.swift
//  GreenBank.UIComponents
//
//  Created by Hovo Ohanyan on 17.01.24.
//

import Foundation

extension String {
    public var localized: String {
        let selectedLanguage = LanguageManager.shared.selectedLanguage
        if let path = Bundle.main.path(forResource: selectedLanguage, ofType: "lproj"),
           let bundle = Bundle(path: path) {
            return bundle.localizedString(forKey: self, value: nil, table: nil)
        }
        return NSLocalizedString(self, comment: "\(self) could not be found in StringLocalization")
    }
}
