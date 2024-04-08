//
//  HomeViewControllerExtnesionTableViewDataSource.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 27.03.24.
//

import UIKit
import GreenBank_UIComponents

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        AppDelegate.shared?.userAccounts = self.homePageModel.accountData
        return self.homePageModel.accountData.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.item < self.homePageModel.accountData.count {
            let cell = homeViewWithCard.tableViewForAccount.dequeueReusableCell(withIdentifier: AccountCell.identifier, for: indexPath) as! AccountCell
            let view = UIView()
            view.backgroundColor = .white
            view.frame.size.height = 1
            view.frame.size.width = cell.frame.width
            cell.addSubview(view)
            cell.backgroundColor = .white
            cell.layer.cornerRadius = 20
            let accountInfo = homePageModel.accountData[indexPath.row]
            
            cell.accountTypeLabel.text = accountInfo.accountType
            cell.accountNumberLabel.text = accountInfo.accountNumber
            cell.moneyCountLabel.text = "\(accountInfo.balance)"
            cell.accountTypeLabel.font = UIFont.SFProMedium(size: 15)
            cell.accountNumberLabel.font = UIFont.SFProMedium(size: 12)
            cell.moneyCountLabel.font = UIFont.SFProBold(size: 15)
            cell.textLabel?.textAlignment = .center
            return cell
        } else {
            let cell = homeViewWithCard.tableViewForAccount.dequeueReusableCell(withIdentifier: PlusCellForTV.identifier, for: indexPath) as! PlusCellForTV
            cell.setupUI()
            cell.delegate = self
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // Define the initial state (Before the animation)
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 100, 0 )
        cell.layer.transform = rotationTransform
        // Define the final state (After the animation)
        UIView.animate(withDuration: 0.5, animations: { cell.layer.transform = CATransform3DIdentity })
    }
}
