//
//  ProgressView.swift
//  GreenBank.UIComponents
//
//  Created by Er Baghdasaryan on 17.01.24.
//

import UIKit

public class ProgressView: UIView {
    var firstActivity = ActivityView(color: .sysLightGray)
    var secondActivity = ActivityView(color: .sysLightGray)
    var thirdActivity = ActivityView(color: .sysLightGray)
    var fourthActivity = ActivityView(color: .sysLightGray)
    
    public init(pageNumber: Int) {
        super.init(frame: .zero)
        self.setupUI()
        self.changeComp(pageNumber: pageNumber)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func changeComp(pageNumber: Int) {
        switch (pageNumber) {
        case 1:
        
            NSLayoutConstraint.activate([
                firstActivity.widthAnchor.constraint(equalToConstant: 30),
                secondActivity.widthAnchor.constraint(equalToConstant: 14),
                thirdActivity.widthAnchor.constraint(equalToConstant: 14),
                fourthActivity.widthAnchor.constraint(equalToConstant: 14)
            ])
            
            firstActivity.backgroundColor = .sysGradientFirst
            
        case 2:
            NSLayoutConstraint.activate([
                firstActivity.widthAnchor.constraint(equalToConstant: 14),
                secondActivity.widthAnchor.constraint(equalToConstant: 30),
                thirdActivity.widthAnchor.constraint(equalToConstant: 14),
                fourthActivity.widthAnchor.constraint(equalToConstant: 14)
            ])
            
            firstActivity.backgroundColor = .sysGradientFirst
            secondActivity.backgroundColor = .sysGradientFirst
            
        case 3:
            NSLayoutConstraint.activate([
                firstActivity.widthAnchor.constraint(equalToConstant: 14),
                secondActivity.widthAnchor.constraint(equalToConstant: 14),
                thirdActivity.widthAnchor.constraint(equalToConstant: 30),
                fourthActivity.widthAnchor.constraint(equalToConstant: 14)
            ])
            
            firstActivity.backgroundColor = .sysGradientFirst
            secondActivity.backgroundColor = .sysGradientFirst
            thirdActivity.backgroundColor = .sysGradientFirst
            
        case 4:
            NSLayoutConstraint.activate([
                firstActivity.widthAnchor.constraint(equalToConstant: 14),
                secondActivity.widthAnchor.constraint(equalToConstant: 14),
                thirdActivity.widthAnchor.constraint(equalToConstant: 14),
                fourthActivity.widthAnchor.constraint(equalToConstant: 30)
            ])
            
            firstActivity.backgroundColor = .sysGradientFirst
            secondActivity.backgroundColor = .sysGradientFirst
            thirdActivity.backgroundColor = .sysGradientFirst
            fourthActivity.backgroundColor = .sysGradientFirst
            
        default:
            fatalError()
        }
    }
    
    func setupUI() {
        firstActivity.translatesAutoresizingMaskIntoConstraints = false
        secondActivity.translatesAutoresizingMaskIntoConstraints = false
        thirdActivity.translatesAutoresizingMaskIntoConstraints = false
        fourthActivity.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(firstActivity)
        self.addSubview(secondActivity)
        self.addSubview(thirdActivity)
        self.addSubview(fourthActivity)
        
        NSLayoutConstraint.activate([
            firstActivity.topAnchor.constraint(equalTo: self.topAnchor),
            firstActivity.leftAnchor.constraint(equalTo: self.leftAnchor),
            firstActivity.rightAnchor.constraint(equalTo: secondActivity.leftAnchor, constant: -14),
            firstActivity.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            fourthActivity.topAnchor.constraint(equalTo: self.topAnchor),
            fourthActivity.leftAnchor.constraint(equalTo: thirdActivity.rightAnchor, constant: 14),
            fourthActivity.rightAnchor.constraint(equalTo: self.rightAnchor),
            fourthActivity.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            secondActivity.topAnchor.constraint(equalTo: self.topAnchor),
            secondActivity.leftAnchor.constraint(equalTo: firstActivity.rightAnchor, constant: 14),
            secondActivity.rightAnchor.constraint(equalTo: thirdActivity.leftAnchor, constant: -14),
            secondActivity.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            thirdActivity.topAnchor.constraint(equalTo: self.topAnchor),
            thirdActivity.leftAnchor.constraint(equalTo: secondActivity.rightAnchor, constant: 14),
            thirdActivity.rightAnchor.constraint(equalTo: fourthActivity.leftAnchor, constant: -14),
            thirdActivity.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}
