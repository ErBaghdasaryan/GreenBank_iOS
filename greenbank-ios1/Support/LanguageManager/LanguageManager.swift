//
//  LanguageManager.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 01.04.24.
//
// LanguageManager.swift

import Foundation

public class LanguageManager {
    public static let shared = LanguageManager()
    
    private init() {}
    
    public var selectedLanguage: String {
        get {
            return UserDefaults.standard.string(forKey: "selectedLanguage") ?? "en" 
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "selectedLanguage")
            NotificationCenter.default.post(name: Notification.Name("LanguageChanged"), object: nil)
        }
    }
}
