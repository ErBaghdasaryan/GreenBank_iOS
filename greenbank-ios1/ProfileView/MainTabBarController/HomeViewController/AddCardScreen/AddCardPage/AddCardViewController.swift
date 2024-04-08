//
//  AddCardViewController.swift
//  greenbank-ios1
//
//  Created by Hovo Ohanyan on 07.02.24.
//

import UIKit
import GreenBank_ViewModel
import GreenBank_UIComponents

final class AddCardViewController: BaseViewController<LoginViewModel>, IViewControllerDelegate {
    let addCardView = AddCardView()
    var addCardModel = AddCardModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardColorSetup()
        setupUI()
        makeButtonAction()
    }
    
    private func setupUI() {
        addCardView.frame = view.frame
        
        view.addSubview(addCardView)
        addCardView.setupUI()
        setupDelegate()
    }
    
    private func setupDelegate() {
        addCardView.collectionView.register(CardView.self, forCellWithReuseIdentifier: CardView.identifier)

        addCardView.collectionView.delegate = self
        addCardView.collectionView.dataSource = self
    }
    
    private func cardColorSetup() {
        guard let filePath = Bundle.main.path(forResource: "Cards", ofType: "json") else {
            return
        }
        
        let fileURL = URL(fileURLWithPath: filePath)
        
        do {
            let data = try Data(contentsOf: fileURL)
            
            addCardModel.colors =  try JSONDecoder().decode([CardColor].self, from: data)
        } catch {
            
        }
    }
    
    private func makeButtonAction() {
        let backButton = UIAction { _ in
            self.dismiss(animated: true)
        }
        
        let makeCardAction = UIAction { action in
            let nextVC = MakeCardViewController()
            nextVC.modalPresentationStyle = .fullScreen
            self.present(nextVC, animated: true)
        }
        
        addCardView.addCardButton.addAction(makeCardAction, for: .touchUpInside)
        addCardView.navigationBar.backButton.addAction(backButton, for: .touchUpInside)
    }
    
    func viewControllerDismiss() {
        addCardView.mainView.removeFromSuperview()
        addCardView.collectionView.reloadData()
    }
}
