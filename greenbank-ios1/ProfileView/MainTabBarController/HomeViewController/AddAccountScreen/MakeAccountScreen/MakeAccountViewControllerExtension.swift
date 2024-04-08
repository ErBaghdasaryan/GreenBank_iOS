//
//  MakeAccountViewControllerExtension.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 05.03.24.
//

import UIKit

//MARK: Make ColorSeter's functionality
extension MakeAccountViewController {
    
    public func makeButtonActions() {
        makeAccountView.colorSeter.grayButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        makeAccountView.colorSeter.greenButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        makeAccountView.colorSeter.lightBlueButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        makeAccountView.colorSeter.orangeButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        makeAccountView.colorSeter.darkOrangeButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        makeAccountView.colorSeter.seeBlueButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        makeAccountView.colorSeter.roseRedButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        makeAccountView.colorSeter.yellowSunButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        makeAccountView.colorSeter.darkGrayButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        makeAccountView.colorSeter.lightGrayButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        makeAccountView.colorSeter.darkButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        makeAccountView.colorSeter.skyBlueButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        makeAccountView.colorSeter.everestBlueButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        makeAccountView.colorSeter.darkPurpleButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        makeAccountView.colorSeter.lightPurpleButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        makeAccountView.colorSeter.sunnyGrayButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        switch sender {
        case makeAccountView.colorSeter.grayButton:
            self.makeAccountView.accountView.customizeAccountStyle()
            self.makeAccountView.accountView.backgroundColor = .graySeter1
        case makeAccountView.colorSeter.greenButton:
            self.makeAccountView.accountView.customizeAccountStyle()
            self.makeAccountView.accountView.backgroundColor = .greenSeter1
        case makeAccountView.colorSeter.lightBlueButton:
            self.makeAccountView.accountView.customizeAccountStyle()
            self.makeAccountView.accountView.backgroundColor = .lightBlueSeter1
        case makeAccountView.colorSeter.orangeButton:
            self.makeAccountView.accountView.customizeAccountStyle()
            self.makeAccountView.accountView.backgroundColor = .orangeSeter1
        case makeAccountView.colorSeter.darkOrangeButton:
            self.makeAccountView.accountView.customizeAccountStyle()
            self.makeAccountView.accountView.backgroundColor = .darkOrangeSeter1
        case makeAccountView.colorSeter.seeBlueButton:
            self.makeAccountView.accountView.customizeAccountStyle()
            self.makeAccountView.accountView.backgroundColor = .seeBlueSeter1
        case makeAccountView.colorSeter.roseRedButton:
            self.makeAccountView.accountView.customizeAccountStyle()
            self.makeAccountView.accountView.backgroundColor = .roseRedSeter1
        case makeAccountView.colorSeter.yellowSunButton:
            self.makeAccountView.accountView.customizeAccountStyle()
            self.makeAccountView.accountView.backgroundColor = .yellowSunSeter1
        case makeAccountView.colorSeter.darkGrayButton:
            self.makeAccountView.accountView.customizeAccountStyle()
            self.makeAccountView.accountView.backgroundColor = .darkGraySeter1
        case makeAccountView.colorSeter.lightGrayButton:
            self.makeAccountView.accountView.customizeAccountStyle()
            self.makeAccountView.accountView.backgroundColor = .lightGraySeter1
        case makeAccountView.colorSeter.darkButton:
            self.makeAccountView.accountView.customizeAccountStyle()
            self.makeAccountView.accountView.backgroundColor = .darkSeter1
        case makeAccountView.colorSeter.skyBlueButton:
            self.makeAccountView.accountView.customizeAccountStyle()
            self.makeAccountView.accountView.backgroundColor = .skyBlueSeter1
        case makeAccountView.colorSeter.everestBlueButton:
            self.makeAccountView.accountView.customizeAccountStyle()
            self.makeAccountView.accountView.backgroundColor = .everestBlueSeter1
        case makeAccountView.colorSeter.darkPurpleButton:
            self.makeAccountView.accountView.customizeAccountStyle()
            self.makeAccountView.accountView.backgroundColor = .darkPurpleSeter1
        case makeAccountView.colorSeter.lightPurpleButton:
            self.makeAccountView.accountView.customizeAccountStyle()
            self.makeAccountView.accountView.backgroundColor = .lightPurpleSeter1
        case makeAccountView.colorSeter.sunnyGrayButton:
            self.makeAccountView.accountView.customizeAccountStyle()
            self.makeAccountView.accountView.backgroundColor = .sunnySeter1
        default:
            print("Hello")
        }
    }
}
