//
//  AppDelegate.swift
//  greenbank-ios1
//
//  Created by Hovo Ohanyan on 09.01.24.
//

import UIKit
import GreenBank_ViewModel

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    static var shared = UIApplication.shared.delegate as? AppDelegate
    var userRegisterInformation: AccountData?
    var userCards: [Card]?
    var userAccounts: [Account]?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let initialLanguage = LanguageManager.shared.selectedLanguage
        return true
    }
    
    func changeLanguage(to language: String) {
        LanguageManager.shared.selectedLanguage = language
    }
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

