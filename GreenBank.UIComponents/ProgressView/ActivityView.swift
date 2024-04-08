//
//  ActivityView.swift
//  GreenBank.UIComponents
//
//  Created by Er Baghdasaryan on 30.01.24.
//

import UIKit

public class ActivityView: UIView {
    public init(color: UIColor) {
        super.init(frame: .zero)
        
        self.layer.cornerRadius = 4
        self.backgroundColor = color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

