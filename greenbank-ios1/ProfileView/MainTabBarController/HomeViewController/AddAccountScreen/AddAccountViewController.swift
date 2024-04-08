//
//  AddAccountViewController.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 04.03.24.
//

import UIKit
import GreenBank_ViewModel

final class AddAccountViewController: UIViewController, IViewControllerDelegate {
    
    public let accountView = AddAccountView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        makeButtonAction()
        setInstanceTapes()
    }
    
    func setupUI() {
        accountView.setupUI()
    
        accountView.frame = view.bounds
        
        view.addSubview(accountView)
    }
    
    private func makeButtonAction() {
        let backButton = UIAction { _ in
            self.dismiss(animated: true)
        }
        
        let makeCardAction = UIAction { action in
            let nextVC = MakeAccountViewController()
            nextVC.modalPresentationStyle = .fullScreen
            self.present(nextVC, animated: true)
        }
        
        accountView.addAccountButton.addAction(makeCardAction, for: .touchUpInside)
        accountView.navigationBar.backButton.addAction(backButton, for: .touchUpInside)
    }
    
    func tapToCardView(accountView: AccountView) {
        let cardFromAnimation = creatCardFromAnimation(accountView: accountView)
        
        self.accountView.mainView.alpha = 0.7
        self.accountView.mainView.frame = view.frame
        self.accountView.mainView.backgroundColor = .red
        self.accountView.mainView.setupUI()
    
        self.view.addSubview(self.accountView.mainView)
        self.accountView.mainView.blurEffectView.contentView.addSubview(cardFromAnimation)
        
        cardFromAnimation.center = self.accountView.mainView.center
        cardFromAnimation.center.y -= 18
        
        UIView.animate(withDuration: 0.4) {
            self.accountView.mainView.alpha = 1
        }
        
        UIView.animate(withDuration: 1) {
            self.accountView.mainView.alpha = 1
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
        self.accountView.mainView.removeFromSuperview()
    }
    
    private func creatCardFromAnimation(accountView: AccountView) -> UIView {
        let cardFromAnimation = UIView()
        cardFromAnimation.frame = accountView.bounds
        cardFromAnimation.addSubview(accountView)
        return cardFromAnimation
    }
}
