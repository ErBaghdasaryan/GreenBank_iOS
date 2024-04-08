//
//  TabBarItemView.swift
//  GreenBank.UIComponents
//
//  Created by Er Baghdasaryan on 31.01.24.
//

import UIKit

public class TabBarItemView: UIView {

    public var iconImageButton: UIButton = UIButton()
    
    public init() {
        super.init(frame: .zero)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupUI()
    }
    
    private func setupUI() {
        self.backgroundColor = .white
        
        addSubview(iconImageButton)
        
        iconImageButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            iconImageButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconImageButton.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            iconImageButton.widthAnchor.constraint(equalToConstant: 20),
            iconImageButton.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    public func update(image: UIImage?) {
        iconImageButton.setImage(image, for: .normal)
    }
}
