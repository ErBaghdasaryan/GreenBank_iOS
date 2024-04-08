//
//  PresentView.swift
//  greenbank-ios1
//
//  Created by Hovo Ohanyan on 31.01.24.
//

import UIKit
import GreenBank_UIComponents

final class PresentView: UIView {
    private let logoImageView = UIImageView(image: UIImage(named: "logo"))
    private let textImageView = UIImageView(image: UIImage(named: "greenBankText"))
    
    let logInButton = PrimaryButton(title: "button_login_title".localized,
                                            titleColor: UIColor.white)
    
    let getStartedButton = SecondaryButton(title: "button_getStarted_title".localized,
                                                   titleColor: UIColor.black)
    
    private let backgroundView = BackgroundView()
    
    lazy private var buttonStackView = UIStackView(arrangedSubviews: [logInButton, getStartedButton])
    
    override func layoutSubviews() {
        super.layoutSubviews()
        logInButton.backgroundGradientLayer.frame = CGRect(x: 0, y: 0,
                                                           width: logInButton.bounds.size.width,
                                                           height: logInButton.bounds.size.height)
    }
    
    func setupUI() {
        self.backgroundColor = .white
        
        buttonStackView.axis = .vertical
        buttonStackView.spacing = 10
        buttonStackView.distribution = .fillEqually
        buttonStackView.alpha = 0
        
        backgroundView.frame = self.frame
        backgroundView.bounds = self.bounds
        backgroundView.alpha = 0
        backgroundView.setupUI()
        
        buttonStackView.frame.size = CGSize(width: 315, height: 98)
        
        self.addSubview(backgroundView)
        self.addSubview(buttonStackView)
    }
    
    func makeAnimation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.makeFirstAnimation()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.makeSecondAnimation()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            self.makeThirdAnimation()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.makeBackgroundAnimation()
            self.layoutSubviews()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.5) {
            self.backgroundView.makeAnimation(width: Int(self.frame.width), height: Int(self.frame.height))
        }
    }
    
    func makeFirstAnimation() {
        self.addSubview(logoImageView)
        
        let centerX = self.center.x
        let centerY = self.center.y
        
        logoImageView.alpha = 0.4
        
        self.logoImageView.bounds.size.height = 20
        self.logoImageView.bounds.size.width = 20
        self.logoImageView.center.x = centerX
        self.logoImageView.center.y = centerY + CGFloat(120)
        
        UIView.animate(withDuration: 0.5) {
            self.configureImageView(imageView: self.logoImageView,
                                    width: self.bounds.width, height: self.bounds.height,
                                    originalWidth: 77.62, originalHeight: 96)
            
            self.logoImageView.center.x = centerX
            self.logoImageView.center.y = centerY
            
            self.logoImageView.alpha = 1
        }
    }
    
    func makeSecondAnimation() {
        self.addSubview(textImageView)
        
        self.textImageView.frame.size = CGSize(width: 100, height: 20)
        self.textImageView.center = CGPoint(x: self.center.x + CGFloat(100), y: self.center.y)
        
        UIView.animate(withDuration: 0.5) {
            self.configureImageView(imageView: self.logoImageView,
                                    width: self.frame.width,
                                    height: self.frame.height,
                                    originalWidth: 42.04, originalHeight: 52)
            
            self.logoImageView.frame.origin.x = 46
            
            
            self.configureImageView(imageView: self.textImageView,
                                    width: self.frame.width,
                                    height: self.frame.height,
                                    originalWidth: 246.59, originalHeight: 37.53)
            
            let x = self.logoImageView.frame.maxX + CGFloat(13)
            let y = self.logoImageView.frame.maxY - CGFloat(self.textImageView.bounds.height)
            
            self.textImageView.frame.origin = CGPoint(x: x, y: y)
        }
    }
    
    func makeThirdAnimation() {
        buttonStackView.center.x = self.center.x
        buttonStackView.frame.origin.y = self.frame.maxY
        
        UIView.animate(withDuration: 0.7) {
            self.logoImageView.frame.origin = CGPoint(x: 46, y: 100)
            
            let x = self.logoImageView.frame.maxX + CGFloat(13)
            let y = self.logoImageView.frame.maxY - CGFloat(self.textImageView.bounds.height)
            
            self.textImageView.frame.origin = CGPoint(x: x, y: y)
            
            self.buttonStackView.frame.origin.y -= 140
            self.buttonStackView.alpha = 1
        }
    }
    
    func makeBackgroundAnimation() {
        UIView.animate(withDuration: 1) {
            self.backgroundView.alpha = 1
        }
    }
    
    func configureImageView(imageView: UIImageView, width: CGFloat, height: CGFloat,
                            originalWidth: CGFloat, originalHeight: CGFloat) {
        let newWidth = (width / 393) * originalWidth
        let newHeight = (height / 852) * originalHeight
        
        imageView.bounds.size.width = newWidth
        imageView.bounds.size.height = newHeight
    }
}
