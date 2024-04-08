//
//  AddAccountViewControllerExtension.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 05.03.24.
//

import UIKit

extension AddAccountViewController {
    
    public func setInstanceTapes() {
        let tapGestureFirst = UITapGestureRecognizer(target: self, action: #selector(instanceTapped(_:)))
        accountView.firstInstance.addGestureRecognizer(tapGestureFirst)
        
        let tapGestureSecond = UITapGestureRecognizer(target: self, action: #selector(instanceTapped(_:)))
        accountView.secondInstance.addGestureRecognizer(tapGestureSecond)
        
        let tapGestureThird = UITapGestureRecognizer(target: self, action: #selector(instanceTapped(_:)))
        accountView.thirdInstance.addGestureRecognizer(tapGestureThird)
        
        let tapGestureFourth = UITapGestureRecognizer(target: self, action: #selector(instanceTapped(_:)))
        accountView.fourthInstance.addGestureRecognizer(tapGestureFourth)
    }

    @objc private func instanceTapped(_ sender: UITapGestureRecognizer) {
        if let accountView = sender.view as? AccountView {
            tapToCardView(accountView: accountView)
        }
    }
}
