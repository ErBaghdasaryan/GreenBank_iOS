//
//  FormView.swift
//  GreenBank.UIComponents
//
//  Created by Er Baghdasaryan on 11.03.24.
//

import UIKit

public class FormView: UIView {
    
    public let imageForm = UIButton()
    private let titleForm = UILabel(text: "",
                                    textColor: .black,
                                    font: .SFProRegular(size: 13))
    
    public init(image: UIImage, text: String) {
        super.init(frame: .zero)
        imageForm.setImage(image, for: .normal)
        titleForm.text = text
        titleForm.textAlignment = .center
        setupUI()
    }
    
    private func setupUI() {
        imageForm.translatesAutoresizingMaskIntoConstraints = false
        titleForm.translatesAutoresizingMaskIntoConstraints = false
        
        self.backgroundColor = .white
        addSubview(imageForm)
        addSubview(titleForm)
        
        layer.masksToBounds = true
        layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            imageForm.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageForm.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageForm.heightAnchor.constraint(equalToConstant: 87),
            imageForm.widthAnchor.constraint(equalToConstant: 86)
        ])
        
        NSLayoutConstraint.activate([
            titleForm.topAnchor.constraint(equalTo: topAnchor, constant: 125),
            titleForm.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 36.3),
            titleForm.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -36.31),
            titleForm.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
