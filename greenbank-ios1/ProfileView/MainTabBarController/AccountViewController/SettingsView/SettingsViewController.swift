//
//  SettingsViewController.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 29.03.24.
//

import UIKit
import GreenBank_ViewModel

final class SettingsViewController: BaseViewController<ProfileViewModel> {
    
    public let settingsView = SettingsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        makeButtonActions()
    }
    
    private func setupUI() {
        settingsView.frame = view.bounds
        settingsView.setupUI()
        view.addSubview(settingsView)
    }
    
    private func makeButtonActions() {
        let backAction = UIAction { _ in
            self.dismiss(animated: true)
        }
        
        let goLanguagePage = UIAction { _ in
            let nextVC = LanguageViewController()
            nextVC.modalPresentationStyle = .fullScreen
            self.present(nextVC, animated: true)
        }
        
        self.settingsView.navigationBar.backButton.addAction(backAction, for: .touchUpInside)
        self.settingsView.languageSettings.button.addAction(goLanguagePage, for: .touchUpInside)
    }
}
