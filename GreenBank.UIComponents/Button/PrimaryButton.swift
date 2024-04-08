//
//  PrimaryButton.swift
//  GreenBank.UIComponents
//
//  Created by Eprem Sargsyan on 13.01.24.
//

import UIKit

public class PrimaryButton: UIButton {
    
    public var backgroundGradientLayer: CAGradientLayer! {
        didSet {
            backgroundGradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
            backgroundGradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
            backgroundGradientLayer.colors = [ UIColor.sysGradientFirst.cgColor,
                                               UIColor.sysGradientSecond.cgColor ]
            backgroundGradientLayer.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 0.99, c: -0.99, d: 0, tx: 0.99, ty: 0.08))
            backgroundGradientLayer.bounds = self.bounds.insetBy(dx: -0.5*self.bounds.size.width, dy: -0.5*self.bounds.size.height)
            backgroundGradientLayer.position = self.center
        }
    }
    
    public convenience init(title: String,
                            titleColor: UIColor,
                            rightImage: UIImage? = nil,
                            leftImage: UIImage? = nil) {
        
        self.init(type: .system)
        
        setupGradient()
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.layer.cornerRadius = 21
        self.layer.masksToBounds = true
        self.titleLabel?.font = UIFont.SFProSemiBold(size: 14)
        
        if let rightImage {
            
            let imageView = UIImageView(image: rightImage)
            
            imageView.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(imageView)
            
            NSLayoutConstraint.activate([
                imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
                imageView.widthAnchor.constraint(equalToConstant: 20),
                imageView.heightAnchor.constraint(equalToConstant: 20)
            ])
        }
        
        if let leftImage {
            let imageView = UIImageView(image: leftImage)
            
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            self.addSubview(imageView)
            
            NSLayoutConstraint.activate([
                imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
                imageView.widthAnchor.constraint(equalToConstant: 20),
                imageView.heightAnchor.constraint(equalToConstant: 20)
            ])
        }
    }
    
    public func setupGradient() {
        self.backgroundGradientLayer = CAGradientLayer()
        self.layer.insertSublayer(backgroundGradientLayer, at: 0)
    }
}
