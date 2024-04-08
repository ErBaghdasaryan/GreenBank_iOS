//
//  HomeViewControlelr.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 31.01.24.
//

import UIKit
import GreenBank_ViewModel
import GreenBank_UIComponents

final class HomeViewController: BaseViewController<HomeViewModel>, PlusCellCVDelegate, PlusCellTVDelegate {
    
    public var homeViewWithCard = HomeViewWithCard()
    public var homeViewWithNoneCard = HomeViewWithNoneCard()
    
    var homePageModel = HomePageModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        featchUserData()
        setupUI()
        makeButtonsAction()
    }
    
    private func setupUI() {
        self.viewModel = HomeViewModel()
        
        if let cards = homePageModel.userData?.userDto.cards {
            if !cards.isEmpty {
                homeViewWithCard.setupUI()
                self.setupDelegate()
                self.featchCard()
                self.fetchAccount()
                view.addSubview(homeViewWithCard)
                homeViewWithCard.frame = view.bounds
            } else {
                homeViewWithNoneCard.setupUI()
                view.addSubview(homeViewWithNoneCard)
                homeViewWithNoneCard.frame = view.bounds
            }
        }
    }
    
    private func makeButtonsAction() {
        let addCardAction = UIAction { action in
            let nextVC = AddCardViewController()
            nextVC.modalPresentationStyle = .fullScreen
            self.present(nextVC, animated: true)
        }
        
        let tryBalanceAction = UIAction { _ in
            let nextVC = AddAccountViewController()
            nextVC.modalPresentationStyle = .fullScreen
            self.present(nextVC, animated: true)
        }
        
        let notifyAction = UIAction { _ in
            //MARK: TO DO 
        }
        
        
        homeViewWithNoneCard.addButton.addAction(addCardAction, for: .touchUpInside)
        homeViewWithNoneCard.tryBalanceButton.addAction(tryBalanceAction, for: .touchUpInside)
        homeViewWithCard.notifyButton.addAction(notifyAction, for: .touchUpInside)
    }
    
    func featchUserData() {
            homePageModel.userData = AppDelegate.shared?.userRegisterInformation
    }
    
    func featchCard() {
        let userID = AppDelegate.shared?.userRegisterInformation?.userDto.id
        homeViewWithCard.activityIndicartor.startAnimating()
        homeViewWithCard.collectionViewForCard.isHidden.toggle()
        homeViewWithCard.tableViewForAccount.isHidden.toggle()
        Task {
            do {
                homePageModel.cardData = try await viewModel?.getCards(accessToken: homePageModel.userData?.accessToken ?? "", userID: userID!) ?? []
                AppDelegate.shared?.userCards = homePageModel.cardData
                homeViewWithCard.collectionViewForCard.reloadData()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchAccount() {
        let userID = AppDelegate.shared?.userRegisterInformation?.userDto.id
        Task {
            do {
                homePageModel.accountData = try await viewModel?.getAccounts(accessToken: homePageModel.userData?.accessToken ?? "", userID: userID!) ?? []
                AppDelegate.shared?.userAccounts = homePageModel.accountData
                homeViewWithCard.tableViewForAccount.reloadData()
                homeViewWithCard.activityIndicartor.stopAnimating()
                homeViewWithCard.collectionViewForCard.isHidden.toggle()
                homeViewWithCard.tableViewForAccount.isHidden.toggle()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    
    private func setupDelegate() {
        homeViewWithCard.collectionViewForCard.register(CardView.self, forCellWithReuseIdentifier: CardView.identifier)
        homeViewWithCard.collectionViewForCard.register(PlusCellForCV.self, forCellWithReuseIdentifier: PlusCellForCV.identifier)
        homeViewWithCard.collectionViewForCard.delegate = self
        homeViewWithCard.collectionViewForCard.dataSource = self
        
        homeViewWithCard.tableViewForAccount.register(AccountCell.self, forCellReuseIdentifier: AccountCell.identifier)
        homeViewWithCard.tableViewForAccount.register(PlusCellForTV.self, forCellReuseIdentifier: PlusCellForTV.identifier)
        homeViewWithCard.tableViewForAccount.delegate = self
        homeViewWithCard.tableViewForAccount.dataSource = self
    }

    func didTapCVAddButton() {
        let nextVC = AddCardViewController()
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true)
    }
    
    func didTapTVAddButton() {
        let nextVC = AddAccountViewController()
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true)
    }
}
