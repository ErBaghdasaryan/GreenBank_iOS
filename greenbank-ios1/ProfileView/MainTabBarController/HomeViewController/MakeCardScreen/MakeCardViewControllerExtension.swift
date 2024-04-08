//
//  MakeCardViewControllerExtension.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 13.02.24.
//

import UIKit

//MARK: Make ColorSeter's functionality
extension MakeCardViewController {
    
    public func makeButtonActions() {
        makeCardView.colorSeter.grayButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        makeCardView.colorSeter.greenButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        makeCardView.colorSeter.lightBlueButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        makeCardView.colorSeter.orangeButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        makeCardView.colorSeter.darkOrangeButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        makeCardView.colorSeter.seeBlueButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        makeCardView.colorSeter.roseRedButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        makeCardView.colorSeter.yellowSunButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        makeCardView.colorSeter.darkGrayButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        makeCardView.colorSeter.lightGrayButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        makeCardView.colorSeter.darkButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        makeCardView.colorSeter.skyBlueButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        makeCardView.colorSeter.everestBlueButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        makeCardView.colorSeter.darkPurpleButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        makeCardView.colorSeter.lightPurpleButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        makeCardView.colorSeter.sunnyGrayButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        switch sender {
        case makeCardView.colorSeter.grayButton:
            self.makeCardView.cardView.editColors(firstHalfColor: .graySeter1, secondHalfColor: .graySeter2)
        case makeCardView.colorSeter.greenButton:
            self.makeCardView.cardView.editColors(firstHalfColor: .greenSeter1, secondHalfColor: .greenSeter2)
        case makeCardView.colorSeter.lightBlueButton:
            self.makeCardView.cardView.editColors(firstHalfColor: .lightBlueSeter1, secondHalfColor: .lightBlueSeter2)
        case makeCardView.colorSeter.orangeButton:
            self.makeCardView.cardView.editColors(firstHalfColor: .orangeSeter1, secondHalfColor: .orangeSeter2)
        case makeCardView.colorSeter.darkOrangeButton:
            self.makeCardView.cardView.editColors(firstHalfColor: .darkOrangeSeter1, secondHalfColor: .darkOrangeSeter2)
        case makeCardView.colorSeter.seeBlueButton:
            self.makeCardView.cardView.editColors(firstHalfColor: .seeBlueSeter1, secondHalfColor: .seeBlueSeter2)
        case makeCardView.colorSeter.roseRedButton:
            self.makeCardView.cardView.editColors(firstHalfColor: .roseRedSeter1, secondHalfColor: .roseRedSeter2)
        case makeCardView.colorSeter.yellowSunButton:
            self.makeCardView.cardView.editColors(firstHalfColor: .yellowSunSeter1, secondHalfColor: .yellowSunSeter2)
        case makeCardView.colorSeter.darkGrayButton:
            self.makeCardView.cardView.editColors(firstHalfColor: .darkGraySeter1, secondHalfColor: .darkGraySeter2)
        case makeCardView.colorSeter.lightGrayButton:
            self.makeCardView.cardView.editColors(firstHalfColor: .lightGraySeter1, secondHalfColor: .lightGraySeter2)
        case makeCardView.colorSeter.darkButton:
            self.makeCardView.cardView.editColors(firstHalfColor: .darkSeter1, secondHalfColor: .darkSeter2)
        case makeCardView.colorSeter.skyBlueButton:
            self.makeCardView.cardView.editColors(firstHalfColor: .skyBlueSeter1, secondHalfColor: .skyBlueSeter2)
        case makeCardView.colorSeter.everestBlueButton:
            self.makeCardView.cardView.editColors(firstHalfColor: .everestBlueSeter1, secondHalfColor: .everestBlueSeter2)
        case makeCardView.colorSeter.darkPurpleButton:
            self.makeCardView.cardView.editColors(firstHalfColor: .darkPurpleSeter1, secondHalfColor: .darkPurpleSeter2)
        case makeCardView.colorSeter.lightPurpleButton:
            self.makeCardView.cardView.editColors(firstHalfColor: .lightPurpleSeter1, secondHalfColor: .lightPurpleSeter2)
        case makeCardView.colorSeter.sunnyGrayButton:
            self.makeCardView.cardView.editColors(firstHalfColor: .sunnySeter1, secondHalfColor: .sunnySeter2)
        default:
            print("Hello")
        }
    }
}
