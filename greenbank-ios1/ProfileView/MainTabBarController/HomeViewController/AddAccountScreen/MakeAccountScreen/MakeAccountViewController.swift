//
//  MakeAccountViewController.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 05.03.24.
//

import UIKit
import GreenBank_ViewModel

final class MakeAccountViewController: UIViewController, IViewControllerDelegate {
    
    public var makeAccountView = MakeAccountView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        makeButtonActions()
        makeButtonAction()
    }
    
    private func setupUI() {
        makeAccountView.frame = view.bounds
        makeAccountView.setupUI()
        view.addSubview(makeAccountView)
    }
    
    private func makeButtonAction() {
        let continueAction = UIAction { _ in
            self.tapToCardView()
        }
        let backAction = UIAction { _ in
            self.dismiss(animated: true)
        }
        
        makeAccountView.continueButton.addAction(continueAction, for: .touchUpInside)
        makeAccountView.navigationBar.backButton.addAction(backAction, for: .touchUpInside)
    }
    
    func tapToCardView() {
        let cardFromAnimation = creatCardFromAnimation(accountView: makeAccountView.accountView)
        
        makeAccountView.mainView.alpha = 0.7
        makeAccountView.mainView.frame = view.frame
        makeAccountView.mainView.backgroundColor = .red
        makeAccountView.mainView.setupUI()
    
        self.view.addSubview(makeAccountView.mainView)
        makeAccountView.mainView.blurEffectView.contentView.addSubview(cardFromAnimation)
        
        cardFromAnimation.center = makeAccountView.mainView.center
        cardFromAnimation.center.y -= 18
        
        UIView.animate(withDuration: 0.4) {
            self.makeAccountView.mainView.alpha = 1
        }
        
        UIView.animate(withDuration: 1) {
            self.makeAccountView.mainView.alpha = 1
            cardFromAnimation.frame.origin.y -= 100
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.makeEffect(for: cardFromAnimation)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) { [self] in
                let nextVC = EditAccountViewController()
                nextVC.editAccountView.accountView = cardFromAnimation
                nextVC.editAccountView.accountViewFrame = cardFromAnimation.frame
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
        makeAccountView.mainView.removeFromSuperview()
    }
    
    private func creatCardFromAnimation(accountView: AccountView) -> UIView {
        let cardFromAnimation = UIView()
        cardFromAnimation.frame = accountView.bounds
        cardFromAnimation.addSubview(accountView)
        return cardFromAnimation
    }
}
