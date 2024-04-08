//
//  FourthRegisterViewController.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 25.01.24.
//

import UIKit
import GreenBank_UIComponents
import GreenBank_UIComponents
import GreenBank_ViewModel

final class FourthRegisterViewController: UIViewController {

    var registerView = FourthRegisterView()
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        view.addSubview(registerView)
        makeButtonAction()
        self.navigationItem.hidesBackButton = true
        registerView.frame = view.frame
        registerView.bounds = view.bounds
        
        registerView.setupUI()
    }

    func makeButtonAction() {
        let continueAction = UIAction { _ in
            let nextVC = LoginViewController()
            self.show(nextVC, sender: nil)
            nextVC.modalPresentationStyle = .fullScreen
        }
        
        registerView.logInButton.addAction(continueAction, for: .touchUpInside)
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
