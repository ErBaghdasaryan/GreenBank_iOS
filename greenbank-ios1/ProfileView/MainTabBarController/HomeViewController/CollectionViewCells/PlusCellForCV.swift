//
//  PlusCell.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 27.03.24.
//

import UIKit
import GreenBank_UIComponents
import GreenBank_ViewModel

final class PlusCellForCV: UICollectionViewCell {

    public var addAccountButton = UIButton(type: .system)
    static let identifier = "PlusCell"
    weak var delegate: PlusCellCVDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.cornerRadius = 10
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 10
        
        addAccountButton.translatesAutoresizingMaskIntoConstraints = false
        
        customizePlusButton()
        
        self.addSubview(addAccountButton)
        
        makeAutoLayout()
    }
    
    func makeAutoLayout() {
        NSLayoutConstraint.activate([
            addAccountButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            addAccountButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            addAccountButton.widthAnchor.constraint(equalToConstant: 46),
            addAccountButton.heightAnchor.constraint(equalToConstant: 46)
        ])
    }
    
    private func customizePlusButton() {
        self.addAccountButton.tintColor = .black
        self.addAccountButton.setImage(UIImage(named: "green_Plus_Button".localized)?.withRenderingMode(.alwaysTemplate), for: .normal)
        self.addAccountButton.layer.borderWidth = 2
        self.addAccountButton.layer.borderColor = UIColor.sysGlobalGreen.cgColor
        self.addAccountButton.layer.cornerRadius = 24
        self.addAccountButton.layer.masksToBounds = true
        
        self.addAccountButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }
    
    @objc private func addButtonTapped() {
        delegate?.didTapCVAddButton()
    }
}
