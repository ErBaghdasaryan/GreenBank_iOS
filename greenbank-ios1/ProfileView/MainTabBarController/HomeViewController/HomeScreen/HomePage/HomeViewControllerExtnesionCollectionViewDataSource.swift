//
//  HomeViewControllerExtnesionCollectionViewDataSource.swift
//  greenbank-ios1
//
//  Created by Hovo Ohanyan on 09.02.24.
//

import UIKit
import GreenBank_UIComponents

extension HomeViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        AppDelegate.shared?.userCards = self.homePageModel.cardData
        return self.homePageModel.cardData.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item < self.homePageModel.cardData.count {
            let cell = homeViewWithCard.collectionViewForCard.dequeueReusableCell(withReuseIdentifier: CardView.identifier, for: indexPath) as! CardView
            cell.setupComponents(card: self.homePageModel.cardData[indexPath.row])
            cell.setupUI()
            return cell
        } else {
            let cell = homeViewWithCard.collectionViewForCard.dequeueReusableCell(withReuseIdentifier: PlusCellForCV.identifier, for: indexPath) as! PlusCellForCV
            cell.setupUI()
            cell.delegate = self
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item >= self.homePageModel.cardData.count {
//            self.tapPlusCardCell()
        }
    }
}
