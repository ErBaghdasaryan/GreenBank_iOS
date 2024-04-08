//
//  NavigationBar.swift
//  GreenBank.UIComponents
//
//  Created by Er Baghdasaryan on 08.02.24.
//

import UIKit

public class NavigationBar: UIView {
    
    public let backButton = UIButton(type: .system)
    public var titleLabel: UILabel!
    public var greenView = UIView()
    
    public init(titleText: String) {
        super.init(frame: .zero)
        self.titleLabel = UILabel(text: titleText,
                                  textColor: .black,
                                  font: .SFProSemiBold(size: 16))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupConstraints() {
        backButton.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        greenView.translatesAutoresizingMaskIntoConstraints = false
        setupUI()
        backButton.frame.size = CGSize(width: 30, height: 30)
        titleLabel.frame.size = CGSize(width: 93, height: 19)
        self.addSubview(backButton)
        self.addSubview(titleLabel)
        self.addSubview(greenView)
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: self.topAnchor),
            backButton.leftAnchor.constraint(equalTo: self.leftAnchor),
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
        ])
        
        NSLayoutConstraint.activate([
            greenView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            greenView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            greenView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            greenView.heightAnchor.constraint(equalToConstant: 5)
        ])
        
        self.bottomAnchor.constraint(equalTo: greenView.bottomAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: greenView.trailingAnchor).isActive = true
    }
    
    public func setupUI() {
        backButton.setImage(UIImage(named: "backButton_title".localized)?.withRenderingMode(.alwaysTemplate), for: .normal)
        backButton.tintColor = .black
        titleLabel.textAlignment = .center
        greenView.backgroundColor = .sysGlobalGreen
        greenView.layer.cornerRadius = 2
        greenView.layer.masksToBounds = true
    }
}
