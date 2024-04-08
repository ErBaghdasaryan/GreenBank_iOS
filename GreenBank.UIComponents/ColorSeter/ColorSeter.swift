//
//  ColorSeter.swift
//  GreenBank.UIComponents
//
//  Created by Er Baghdasaryan on 12.02.24.
//

import UIKit

public class ColorSeter: UIView {
    public let grayButton = UIButton(imageName: "colorSeter_gray".localized)
    public let greenButton = UIButton(imageName: "colorSeter_green".localized)
    public let lightBlueButton = UIButton(imageName: "colorSeter_lightBlue".localized)
    public let orangeButton = UIButton(imageName: "colorSeter_orange".localized)
    public let darkOrangeButton = UIButton(imageName: "colorSeter_darkOrange".localized)
    public let seeBlueButton = UIButton(imageName: "colorSeter_seeBlue".localized)
    public let roseRedButton = UIButton(imageName: "colorSeter_roseRed".localized)
    public let yellowSunButton = UIButton(imageName: "colorSeter_yellowSun".localized)
    public let darkGrayButton = UIButton(imageName: "colorSeter_darkGray".localized)
    public let lightGrayButton = UIButton(imageName: "colorSeter_lightGray".localized)
    public let darkButton = UIButton(imageName: "colorSeter_dark".localized)
    public let skyBlueButton = UIButton(imageName: "colorSeter_skyBlue".localized)
    public let everestBlueButton = UIButton(imageName: "colorSeter_everestBlue".localized)
    public let darkPurpleButton = UIButton(imageName: "colorSeter_darkPurple".localized)
    public let lightPurpleButton = UIButton(imageName: "colorSeter_lightPurple".localized)
    public let sunnyGrayButton = UIButton(imageName: "colorSeter_lightGray".localized)
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    private func setupUI() {
        backgroundColor = .clear
        
        let row1StackView = createStackView(with: [grayButton, greenButton, lightBlueButton, orangeButton])
        let row2StackView = createStackView(with: [darkOrangeButton, seeBlueButton, roseRedButton, yellowSunButton])
        let row3StackView = createStackView(with: [darkGrayButton, lightGrayButton, darkButton, skyBlueButton])
        let row4StackView = createStackView(with: [everestBlueButton, darkPurpleButton, lightPurpleButton, sunnyGrayButton])
        
        let mainStackView = UIStackView(arrangedSubviews: [row1StackView, row2StackView, row3StackView, row4StackView])
        mainStackView.axis = .vertical
        mainStackView.alignment = .fill
        mainStackView.distribution = .fillEqually
        mainStackView.spacing = 10
        
        addSubview(mainStackView)
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func createStackView(with buttons: [UIButton]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }
}
