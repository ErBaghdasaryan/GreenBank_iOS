//
//  AddCardViewExtensionCollectionViewDelegate.swift
//  greenbank-ios1
//
//  Created by Hovo Ohanyan on 07.02.24.
//

import UIKit
import GreenBank_UIComponents

extension AddCardViewController: UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        guard let collectionView = self.addCardView.collectionView else {
            return
        }
        
        let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        
        if let indexPath = collectionView.indexPathForItem(at: visiblePoint) {
            // indexPath.row will give you the index of the currently visible item
            switch indexPath.item {
            case 0:
                let newProgressView = ProgressView(pageNumber: 1)
                UIView.animate(withDuration: 0.5) {
                    self.addAnotherPV(progressView: newProgressView)
                }
            case 1:
                let newProgressView = ProgressView(pageNumber: 2)
                UIView.animate(withDuration: 0.5) {
                    self.addAnotherPV(progressView: newProgressView)
                }
            case 2:
                let newProgressView = ProgressView(pageNumber: 3)
                UIView.animate(withDuration: 0.5) {
                    self.addAnotherPV(progressView: newProgressView)
                }
            case 3:
                let newProgressView = ProgressView(pageNumber: 4)
                UIView.animate(withDuration: 0.5) {
                    self.addAnotherPV(progressView: newProgressView)
                }
            default:
                // Handle other cases if needed
                break
            }
        }
    }
    
    private func addAnotherPV(progressView: ProgressView) {
        progressView.translatesAutoresizingMaskIntoConstraints = false
        addCardView.underProgressView.removeAllSubviews()
        self.addCardView.underProgressView.addSubview(progressView)
        
        NSLayoutConstraint.activate([
            progressView.widthAnchor.constraint(equalToConstant: 114),
            progressView.heightAnchor.constraint(equalToConstant: 8),
            progressView.centerXAnchor.constraint(equalTo: addCardView.centerXAnchor),
            progressView.topAnchor.constraint(equalTo: addCardView.collectionView.bottomAnchor, constant: 40)
        ])
    }
}
