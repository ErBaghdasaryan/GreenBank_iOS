//
//  LanguageViewController.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 30.03.24.
//

import UIKit
import GreenBank_ViewModel

final class LanguageViewController: UIViewController {
    
    public let settingsView = LanguageView()
    private var languageType: String?
    
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
        
        self.settingsView.navigationBar.backButton.addAction(backAction, for: .touchUpInside)
        settingsView.armenianLanguage.selectTypeLanguageButton.addTarget(self, action: #selector(selectLanguage(_:)), for: .touchUpInside)
        settingsView.russianLanguage.selectTypeLanguageButton.addTarget(self, action: #selector(selectLanguage(_:)), for: .touchUpInside)
        settingsView.englishLanguage.selectTypeLanguageButton.addTarget(self, action: #selector(selectLanguage(_:)), for: .touchUpInside)
    }
    
    @objc private func selectLanguage(_ sender: UIButton) {
        switch sender {
        case settingsView.armenianLanguage.selectTypeLanguageButton:
            
            settingsView.russianLanguage.selectTypeLanguageButton.imageView?.isHidden = true
            settingsView.englishLanguage.selectTypeLanguageButton.imageView?.isHidden = true
            
            settingsView.russianLanguage.layer.borderColor = UIColor.lightGray.cgColor
            settingsView.englishLanguage.layer.borderColor = UIColor.lightGray.cgColor
            
            if settingsView.armenianLanguage.selectTypeLanguageButton.layer.borderColor == UIColor.sysGradientFirst.cgColor {
                settingsView.armenianLanguage.selectTypeLanguageButton.imageView?.isHidden = true
                settingsView.armenianLanguage.selectTypeLanguageButton.layer.borderColor = UIColor.lightGray.cgColor
                self.languageType = nil
                break
            }
            
            settingsView.armenianLanguage.selectTypeLanguageButton.layer.borderColor = UIColor.sysGradientFirst.cgColor
            settingsView.armenianLanguage.selectTypeLanguageButton.setImage(UIImage(named: "selected_button_image".localized)?.withRenderingMode(.alwaysTemplate), for: .normal)
            settingsView.armenianLanguage.selectTypeLanguageButton.tintColor = .sysGradientFirst
            settingsView.armenianLanguage.selectTypeLanguageButton.imageView?.contentMode = .scaleAspectFit
            
            self.languageType = "hy"
            (UIApplication.shared.delegate as! AppDelegate).changeLanguage(to: self.languageType!)
            reloadApp()

        case settingsView.russianLanguage.selectTypeLanguageButton:
            
            settingsView.armenianLanguage.selectTypeLanguageButton.imageView?.isHidden = true
            settingsView.englishLanguage.selectTypeLanguageButton.imageView?.isHidden = true
            
            settingsView.armenianLanguage.layer.borderColor = UIColor.lightGray.cgColor
            settingsView.englishLanguage.layer.borderColor = UIColor.lightGray.cgColor
            
            if settingsView.russianLanguage.selectTypeLanguageButton.layer.borderColor == UIColor.sysGradientFirst.cgColor {
                settingsView.russianLanguage.selectTypeLanguageButton.imageView?.isHidden = true
                settingsView.russianLanguage.selectTypeLanguageButton.layer.borderColor = UIColor.lightGray.cgColor
                self.languageType = nil
                break
            }

            settingsView.russianLanguage.selectTypeLanguageButton.layer.borderColor = UIColor.sysGradientFirst.cgColor
            settingsView.russianLanguage.selectTypeLanguageButton.setImage(UIImage(named: "selected_button_image".localized)?.withRenderingMode(.alwaysTemplate), for: .normal)
            settingsView.russianLanguage.selectTypeLanguageButton.tintColor = .sysGradientFirst
            settingsView.russianLanguage.selectTypeLanguageButton.imageView?.contentMode = .scaleAspectFit

            self.languageType = "ru"
            (UIApplication.shared.delegate as! AppDelegate).changeLanguage(to: self.languageType!)
            reloadApp()
        
        case settingsView.englishLanguage.selectTypeLanguageButton:
            
            settingsView.armenianLanguage.selectTypeLanguageButton.imageView?.isHidden = true
            settingsView.russianLanguage.selectTypeLanguageButton.imageView?.isHidden = true
            
            settingsView.armenianLanguage.layer.borderColor = UIColor.lightGray.cgColor
            settingsView.russianLanguage.layer.borderColor = UIColor.lightGray.cgColor
            
            if settingsView.englishLanguage.selectTypeLanguageButton.layer.borderColor == UIColor.sysGradientFirst.cgColor {
                settingsView.englishLanguage.selectTypeLanguageButton.imageView?.isHidden = true
                settingsView.englishLanguage.selectTypeLanguageButton.layer.borderColor = UIColor.lightGray.cgColor
                self.languageType = nil
                break
            }

            settingsView.englishLanguage.selectTypeLanguageButton.layer.borderColor = UIColor.sysGradientFirst.cgColor
            settingsView.englishLanguage.selectTypeLanguageButton.setImage(UIImage(named: "selected_button_image".localized)?.withRenderingMode(.alwaysTemplate), for: .normal)
            settingsView.englishLanguage.selectTypeLanguageButton.tintColor = .sysGradientFirst
            settingsView.englishLanguage.selectTypeLanguageButton.imageView?.contentMode = .scaleAspectFit

            self.languageType = "en"
            (UIApplication.shared.delegate as! AppDelegate).changeLanguage(to: self.languageType!)
            reloadApp()
            
        default:
            fatalError()
        }
    }
    
    func reloadApp() {
        DispatchQueue.main.async {
            if let window = UIApplication.shared.windows.first {
                window.rootViewController = MainTabBarController()
            }
        }
    }
}
