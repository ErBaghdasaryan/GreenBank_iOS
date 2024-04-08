//
//  MakeCardViewController.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 09.02.24.
//

import UIKit
import GreenBank_ViewModel

final class MakeCardViewController: BaseViewController<AddCardViewModel>, IViewControllerDelegate {
    
    public var makeCardView = MakeCardView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        makeButtonActions()
        makeButtonAction()
    }
    
    private func setupUI() {
        makeCardView.frame = view.bounds
        makeCardView.setupUI()
        view.addSubview(makeCardView)
    }
    
    private func makeButtonAction() {
        let continueAction = UIAction { _ in
            self.tapToCardView()
        }
        let backAction = UIAction { _ in
            self.dismiss(animated: true)
        }
        
        makeCardView.continueButton.addAction(continueAction, for: .touchUpInside)
        makeCardView.navigationBar.backButton.addAction(backAction, for: .touchUpInside)
    }
    
    func tapToCardView() {
        let cardFromAnimation = creatCardFromAnimation(cardView: makeCardView.cardView)
        
        makeCardView.mainView.alpha = 0.7
        makeCardView.mainView.frame = view.frame
        makeCardView.mainView.backgroundColor = .red
        makeCardView.mainView.setupUI()
    
        self.view.addSubview(makeCardView.mainView)
        makeCardView.mainView.blurEffectView.contentView.addSubview(cardFromAnimation)
        
        cardFromAnimation.center = makeCardView.mainView.center
        cardFromAnimation.center.y -= 18
        
        UIView.animate(withDuration: 0.4) {
            self.makeCardView.mainView.alpha = 1
        }
        
        UIView.animate(withDuration: 1) {
            self.makeCardView.mainView.alpha = 1
            cardFromAnimation.frame.origin.y -= 100
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.makeEffect(for: cardFromAnimation)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                let nextVC = EditCardViewController()
                nextVC.editCardView.cardView = cardFromAnimation
                nextVC.editCardView.cardViewFrame = cardFromAnimation.frame
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
    
    func viewControllerDismiss() {
        makeCardView.mainView.removeFromSuperview()
    }
    
    private func creatCardFromAnimation(cardView: UICollectionViewCell) -> UIView {
        let cardFromAnimation = UIView()
        cardFromAnimation.frame = cardView.bounds
        cardFromAnimation.addSubview(cardView)
        return cardFromAnimation
    }
}
