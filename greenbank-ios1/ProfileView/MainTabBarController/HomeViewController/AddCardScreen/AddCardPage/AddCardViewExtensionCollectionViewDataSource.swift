//
//  AddCardViewExtensionCollectionViewDataSource.swift
//  greenbank-ios1
//
//  Created by Hovo Ohanyan on 07.02.24.
//

import UIKit

extension AddCardViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardView.identifier, for: indexPath) as! CardView
        
        cell.editColors(firstHalfColor: UIColor(hex: addCardModel.colors[indexPath.row].firstHex) ?? .sysGreen,
                        secondHalfColor: UIColor(hex: addCardModel.colors[indexPath.row].secondHex) ?? .sysMainGreen)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CardView {
            tapToCardView(cardView: cell)
        }
    }
        
    func tapToCardView(cardView: UIView) {
        addCardView.mainView.alpha = 0.7
        addCardView.mainView.frame = view.frame
        addCardView.mainView.backgroundColor = .red
        addCardView.mainView.setupUI()
        
        self.view.addSubview(addCardView.mainView)
        addCardView.mainView.blurEffectView.contentView.addSubview(cardView)
        
        cardView.center = addCardView.mainView.center
        cardView.center.y -= 18
        
        UIView.animate(withDuration: 0.4) {
            self.addCardView.mainView.alpha = 1
        }
        
        UIView.animate(withDuration: 1) {
            self.addCardView.mainView.alpha = 1
            cardView.frame.origin.y -= 100
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.makeEffect(for: cardView)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                let nextVC = EditCardViewController()
                nextVC.editCardView.cardView = cardView
                nextVC.editCardView.cardViewFrame = cardView.frame
                nextVC.delegate = self
                nextVC.modalPresentationStyle = .fullScreen
                self.present(nextVC, animated: false)
            }
        }
    }
        
    func makeEffect(for view: UIView) {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.y")
        rotationAnimation.toValue = NSNumber(value: Double.pi * 2)
        rotationAnimation.duration = 1.3
        rotationAnimation.repeatCount = 1 
        
        view.layer.add(rotationAnimation, forKey: "rotationAnimation")
    }
}
