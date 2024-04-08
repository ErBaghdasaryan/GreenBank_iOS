//
//  PersonalInfoView.swift
//  GreenBank.UIComponents
//
//  Created by Er Baghdasaryan on 22.03.24.
//

import UIKit

public class PersonalInfoView: UIView {
    
    public var leftText: UILabel
    public var rightText: UITextField
    
    public init(leftText: String, rightText: String) {
        self.leftText = UILabel(text: leftText,
                           textColor: .black,
                           font: .SFProRegular(size: 12))
        self.rightText = UITextField()
        self.rightText.text = rightText
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupUI() {
        
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 10.91
        self.backgroundColor = .sysPersonInfBack
        
        rightText.textColor = .sysGray
        rightText.font = .SFProRegular(size: 12)
        rightText.backgroundColor = .sysPersonInfBack
        rightText.textAlignment = .right
        
        leftText.translatesAutoresizingMaskIntoConstraints = false
        rightText.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(leftText)
        self.addSubview(rightText)
        
        NSLayoutConstraint.activate([
            leftText.topAnchor.constraint(equalTo: self.topAnchor, constant: 13.27),
            leftText.widthAnchor.constraint(equalToConstant: 125),
            leftText.heightAnchor.constraint(equalToConstant: 19),
            leftText.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 22.9)
        ])
        
        NSLayoutConstraint.activate([
            rightText.topAnchor.constraint(equalTo: self.topAnchor, constant: 13.27),
            rightText.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -13.27),
            rightText.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -22.9)
        ])
    }
}
