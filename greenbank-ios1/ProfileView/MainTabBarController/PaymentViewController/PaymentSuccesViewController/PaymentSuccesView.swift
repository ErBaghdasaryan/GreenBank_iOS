//
//  PaymentSuccesView.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 01.04.24.
//

import UIKit
import GreenBank_UIComponents

public class PaymentSuccesView: UIView {
    
    private let greenBackground = UIImageView(image: UIImage(named: "greenBackground_Image".localized))
    private let postImage = UIImageView(image: UIImage(named: "post_Image".localized))
    private let doneImage = UIView()
    private let successLabel = UILabel(text: "paymentSuccess_Label".localized,
                                       textColor: .black,
                                       font: .SFProSemiBold(size: 24))
    private let thanksLabel = UILabel(text: "thankYou_Label".localized,
                                      textColor: .black,
                                      font: .SFProRegular(size: 12))
    public let homeButton = PrimaryButton(title: "home_Button".localized,
                                              titleColor: .white)
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        setupGradient()
    }
    
    public func setupUI() {
        self.backgroundColor = .sysMainWhite
        
        let labelsStackView = UIStackView(arrangedSubviews: [successLabel, thanksLabel],
                                          axis: .vertical,
                                          spacing: 4)
        
        greenBackground.translatesAutoresizingMaskIntoConstraints = false
        postImage.translatesAutoresizingMaskIntoConstraints = false
        doneImage.translatesAutoresizingMaskIntoConstraints = false
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(greenBackground)
        addSubview(postImage)
        addSubview(doneImage)
        addSubview(labelsStackView)
        addSubview(homeButton)
        
        customizePlusButton()
        customizeLabels()
        
        NSLayoutConstraint.activate([
            greenBackground.topAnchor.constraint(equalTo: self.topAnchor),
            greenBackground.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            greenBackground.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            greenBackground.heightAnchor.constraint(equalToConstant: 266)
        ])
        
        NSLayoutConstraint.activate([
            postImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 156),
            postImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 139),
            postImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -138),
            postImage.bottomAnchor.constraint(equalTo: greenBackground.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            doneImage.centerXAnchor.constraint(equalTo: postImage.centerXAnchor),
            doneImage.centerYAnchor.constraint(equalTo: postImage.centerYAnchor),
            doneImage.heightAnchor.constraint(equalToConstant: 58),
            doneImage.widthAnchor.constraint(equalToConstant: 58)
        ])
        
        NSLayoutConstraint.activate([
            labelsStackView.topAnchor.constraint(equalTo: self.postImage.bottomAnchor, constant: 29),
            labelsStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            labelsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            labelsStackView.heightAnchor.constraint(equalToConstant: 56)
        ])
        
        NSLayoutConstraint.activate([
            homeButton.topAnchor.constraint(equalTo: self.greenBackground.bottomAnchor, constant: 409),
            homeButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            homeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            homeButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func customizeLabels() {
        successLabel.textAlignment = .center
        thanksLabel.textAlignment = .center
    }
    
    private func customizePlusButton() {
        self.doneImage.tintColor = .black
        customizeImage()
        self.doneImage.layer.borderWidth = 2
        self.doneImage.layer.borderColor = UIColor.sysGlobalGreen.cgColor
        self.doneImage.layer.cornerRadius = 29
        self.doneImage.layer.masksToBounds = true
    }
    
    private func customizeImage() {
        let image = UIImageView(image: UIImage(named: "greenDone_Image".localized))
        image.translatesAutoresizingMaskIntoConstraints = false
        addSubview(image)
        NSLayoutConstraint.activate([
            image.centerYAnchor.constraint(equalTo: doneImage.centerYAnchor),
            image.centerXAnchor.constraint(equalTo: doneImage.centerXAnchor),
            image.widthAnchor.constraint(equalToConstant: 26),
            image.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    func setupGradient() {
        homeButton.backgroundGradientLayer.frame = CGRect(x: 0, y: 0,
                                                           width: homeButton.bounds.size.width,
                                                           height: homeButton.bounds.size.height)
    }
}

