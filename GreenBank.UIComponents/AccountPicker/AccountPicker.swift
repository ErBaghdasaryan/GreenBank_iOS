//
//  AccountPicker.swift
//  GreenBank.UIComponents
//
//  Created by Er Baghdasaryan on 20.03.24.
//

import UIKit
import GreenBank_ViewModel

public class AccountPicker: UIView, UITableViewDataSource, UITableViewDelegate {
    var dataForType = [Account]()
    public var showTypeButton: UIButton
    public var selectedTypeText: TextFieldDate
    var typeTable: UITableView
    public var selectedType: String
    public var tableViewHeight: CGFloat
    var activityIndicartor: UIActivityIndicatorView = {
        let active = UIActivityIndicatorView()
        active.color = .sysTrueTFBorder
        return active
    }()
    
    public init(imageName: String,
                placeholder: String,
                tableViewHeight: CGFloat,
                currencyData: [Account]) {
        
        self.tableViewHeight = tableViewHeight
        showTypeButton = UIButton()
        selectedTypeText = TextFieldDate(placeholder: placeholder, image: UIImage(systemName: imageName) ?? UIImage())
        typeTable = UITableView()
        selectedType = "USD"
        self.dataForType = currencyData
        super.init(frame: .zero)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        typeTable.delegate = self
        typeTable.dataSource = self
        typeTable.register(AccountCell.self, forCellReuseIdentifier: AccountCell.identifier)
        
        selectedTypeText.translatesAutoresizingMaskIntoConstraints = false
//        typeTable.translatesAutoresizingMaskIntoConstraints = false
        showTypeButton.translatesAutoresizingMaskIntoConstraints = false
        activityIndicartor.translatesAutoresizingMaskIntoConstraints = false
        
        selectedTypeText.layer.cornerRadius = 21
        selectedTypeText.layer.masksToBounds = true
        
        showTypeButton.layer.borderColor = UIColor.gray.cgColor
        
        self.addSubview(selectedTypeText)
        self.addSubview(showTypeButton)
        typeTable.addSubview(activityIndicartor)
        
        showTypeButton.backgroundColor = .none
        
        NSLayoutConstraint.activate([
            selectedTypeText.topAnchor.constraint(equalTo: self.topAnchor),
            selectedTypeText.leftAnchor.constraint(equalTo: self.leftAnchor),
            selectedTypeText.rightAnchor.constraint(equalTo: self.rightAnchor),
            selectedTypeText.heightAnchor.constraint(equalToConstant: 42)
        ])
        
        NSLayoutConstraint.activate([
            showTypeButton.topAnchor.constraint(equalTo: selectedTypeText.topAnchor),
            showTypeButton.rightAnchor.constraint(equalTo: selectedTypeText.rightAnchor),
            showTypeButton.leftAnchor.constraint(equalTo: selectedTypeText.leftAnchor),
            showTypeButton.bottomAnchor.constraint(equalTo: selectedTypeText.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            activityIndicartor.centerXAnchor.constraint(equalTo: typeTable.centerXAnchor),
            activityIndicartor.centerYAnchor.constraint(equalTo: typeTable.centerYAnchor)
        ])
        
        hideTableView()
        
        showTypeButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    func setupTableViewDay() {
        dataForType.removeAll()
        typeTable.reloadData()
    }
    
    func hideTableView() {
        typeTable.removeFromSuperview()
    }
    
    func hideTextField() {
        selectedTypeText.isHidden = true
    }
    
    func showTextField() {
        selectedTypeText.isHidden = false
    }
    
    func showTableView() {
        typeTable.isHidden = false
        typeTable.separatorStyle = .none
        typeTable.layer.borderWidth = 1
        typeTable.layer.cornerRadius = 20
        typeTable.layer.borderColor = UIColor.sysTrueTFBorder.cgColor
        typeTable.reloadData()
        
        typeTable.translatesAutoresizingMaskIntoConstraints = false
        
        superview?.superview?.addSubview(typeTable)
        
        NSLayoutConstraint.activate([
            typeTable.topAnchor.constraint(equalTo: selectedTypeText.topAnchor),
            typeTable.leftAnchor.constraint(equalTo: selectedTypeText.leftAnchor),
            typeTable.rightAnchor.constraint(equalTo: selectedTypeText.rightAnchor),
            typeTable.heightAnchor.constraint(equalToConstant: tableViewHeight)
        ])
    }
    
    @objc func buttonTapped() {
        showTypeButton.isHidden = true
        showTableView()
        hideTextField()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataForType.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AccountCell.identifier, for: indexPath) as! AccountCell
        let view = UIView()
        view.backgroundColor = .lightGray
        view.frame.size.height = 1
        view.frame.size.width = cell.frame.width
        cell.addSubview(view)
        cell.backgroundColor = .sysMainWhite
        
        let accountInfo = dataForType[indexPath.row]
        
        cell.accountTypeLabel.text = accountInfo.accountType
        cell.accountNumberLabel.text = accountInfo.accountName
        cell.moneyCountLabel.text = "\(accountInfo.balance)"
        cell.accountTypeLabel.font = UIFont.SFProMedium(size: 15)
        cell.accountNumberLabel.font = UIFont.SFProMedium(size: 12)
        cell.moneyCountLabel.font = UIFont.SFProBold(size: 15)
        cell.setupCellImage()
        cell.textLabel?.textAlignment = .center
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedTypeText.text = "\(dataForType[indexPath.row].accountNumber)"
//        selectedType = dataForType[indexPath.row]
        hideTableView()
        showTextField()
        showTypeButton.isHidden = false
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
}
