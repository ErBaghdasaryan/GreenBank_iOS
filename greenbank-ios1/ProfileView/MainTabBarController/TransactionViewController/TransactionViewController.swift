//
//  TransactionViewController.swift
//  greenbank-ios1
//
//  Created by Er Baghdasaryan on 31.01.24.
//

import UIKit

final class TransactionViewController: UIViewController {
    
    let transactionView = TransactionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transactionView.frame = view.bounds
        transactionView.setupUI()
        view.addSubview(transactionView)
    }
}
