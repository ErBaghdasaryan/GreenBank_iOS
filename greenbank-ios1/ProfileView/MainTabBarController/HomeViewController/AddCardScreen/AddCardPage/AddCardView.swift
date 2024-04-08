//
//  AddCardView.swift
//  greenbank-ios1
//
//  Created by Hovo Ohanyan on 07.02.24.
//

import UIKit
import GreenBank_UIComponents
import GreenBank_ViewModel

final class AddCardView: UIView {
    var collectionView: UICollectionView!
    let mainView = BackgroundView()
    var navigationBar = NavigationBar(titleText: "label_Cards".localized)
    public var addCardButton = SecondaryButton(title: "add_Card_Button_Title".localized,
                                               titleColor: .black,
                                               titleFont: .SFProRegular(size: 16),
                                               leftImage: UIImage(named: "green_Plus_Button".localized)?.withRenderingMode(.alwaysTemplate))
    public var underProgressView = UIView()
    public var progressView = ProgressView(pageNumber: 1)

    private func setupCollectionView() {
        let layout = UPCarouselFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 250, height: 155)
        layout.minimumLineSpacing = 10
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        collectionView.showsHorizontalScrollIndicator = false
    }
    
    func setupUI() {
        self.backgroundColor = .sysMainWhite
        setupCollectionView()
        customizeMakeButton()
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        addCardButton.translatesAutoresizingMaskIntoConstraints = false
        underProgressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.translatesAutoresizingMaskIntoConstraints = false

        navigationBar.setupConstraints()

        collectionView.backgroundColor = .sysMainWhite
        
        
        self.addSubview(collectionView)
        self.addSubview(navigationBar)
        self.addSubview(addCardButton)
        self.addSubview(underProgressView)
        underProgressView.addSubview(progressView)

        makeAutoLayout()
    }
    
    private func makeAutoLayout() {
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: self.topAnchor, constant: 65),
            navigationBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            navigationBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            navigationBar.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 310),
            collectionView.leftAnchor.constraint(equalTo: self.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: self.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -380)
        ])
        
        NSLayoutConstraint.activate([
            addCardButton.widthAnchor.constraint(equalToConstant: 152),
            addCardButton.heightAnchor.constraint(equalToConstant: 46),
            addCardButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0.5),
            addCardButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 713)
        ])
        
        NSLayoutConstraint.activate([
            underProgressView.widthAnchor.constraint(equalToConstant: 114),
            underProgressView.heightAnchor.constraint(equalToConstant: 8),
            underProgressView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            underProgressView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 40)
        ])
        
        NSLayoutConstraint.activate([
            progressView.widthAnchor.constraint(equalToConstant: 114),
            progressView.heightAnchor.constraint(equalToConstant: 8),
            progressView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            progressView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 40)
        ])
    }
    
    private func customizeMakeButton() {
        addCardButton.tintColor = .black
        addCardButton.contentHorizontalAlignment = .right
        addCardButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 25)
        addCardButton.layer.borderWidth = 2
        addCardButton.layer.borderColor = UIColor.sysGlobalGreen.cgColor
        addCardButton.layer.cornerRadius = 25
        addCardButton.layer.masksToBounds = true
    }
}
