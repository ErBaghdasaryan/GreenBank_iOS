//
//  UIButton + Extension.swift
//  GreenBank.UIComponents
//
//  Created by Er Baghdasaryan on 12.02.24.
//

import UIKit.UIButton

extension UIButton {
    public convenience init(imageName: String) {
        self.init()
        self.setImage(UIImage(named: imageName), for: .normal)
        self.layer.cornerRadius = self.frame.size.width / 2
        self.layer.masksToBounds = true
    }
}
