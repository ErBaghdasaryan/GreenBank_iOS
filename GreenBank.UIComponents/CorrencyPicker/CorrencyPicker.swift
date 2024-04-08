//
//  CorrencyPicker.swift
//  GreenBank.UIComponents
//
//  Created by Hovo Ohanyan on 08.02.24.
//

import UIKit

public class CurrencyPicker:  UIView, UITableViewDataSource, UITableViewDelegate {
    var dataForCurrency = [String]()
    public var showCurrencyButton: UIButton
    public var selectedCurrencyText: TextFieldDate
    public var currencyTable: UITableView
    public var selectedCurrency: String  {
        didSet {
            if self.validationFromPicker(currency: selectedCurrency) {
                selectedCurrencyText.layer.borderColor = UIColor.sysTrueTFBorder.cgColor
                selectedCurrencyText.rightView?.tintColor = .sysTrueTFBorder
            } else {
                selectedCurrencyText.rightView?.tintColor = .sysFalseTFBorder
                selectedCurrencyText.layer.borderColor = UIColor.sysFalseTFBorder.cgColor
            }
        }
    }
    
    public init(imageName: String,
                placeholder: String,
                currencyData: [String]) {
        
        showCurrencyButton = UIButton()
        selectedCurrencyText = TextFieldDate(placeholder: placeholder, image: UIImage(systemName: imageName) ?? UIImage())
        currencyTable = UITableView()
        selectedCurrency = "USD"
        self.dataForCurrency = currencyData
        super.init(frame: .zero)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        currencyTable.delegate = self
        currencyTable.dataSource = self
        currencyTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell_text".localized)
        
        selectedCurrencyText.translatesAutoresizingMaskIntoConstraints = false
        currencyTable.translatesAutoresizingMaskIntoConstraints = false
        showCurrencyButton.translatesAutoresizingMaskIntoConstraints = false
        
        selectedCurrencyText.layer.cornerRadius = 21
        selectedCurrencyText.layer.masksToBounds = true
        
        showCurrencyButton.layer.borderColor = UIColor.gray.cgColor
        
        self.addSubview(selectedCurrencyText)
        self.addSubview(currencyTable)
        self.addSubview(showCurrencyButton)
        
        showCurrencyButton.backgroundColor = .none
        
        NSLayoutConstraint.activate([
            selectedCurrencyText.topAnchor.constraint(equalTo: self.topAnchor),
            selectedCurrencyText.leftAnchor.constraint(equalTo: self.leftAnchor),
            selectedCurrencyText.rightAnchor.constraint(equalTo: self.rightAnchor),
            selectedCurrencyText.heightAnchor.constraint(equalToConstant: 42)
        ])
        
        NSLayoutConstraint.activate([
            currencyTable.topAnchor.constraint(equalTo: selectedCurrencyText.topAnchor),
            currencyTable.leftAnchor.constraint(equalTo: selectedCurrencyText.leftAnchor),
            currencyTable.rightAnchor.constraint(equalTo: selectedCurrencyText.rightAnchor),
            currencyTable.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            showCurrencyButton.topAnchor.constraint(equalTo: selectedCurrencyText.topAnchor),
            showCurrencyButton.rightAnchor.constraint(equalTo: selectedCurrencyText.rightAnchor),
            showCurrencyButton.leftAnchor.constraint(equalTo: selectedCurrencyText.leftAnchor),
            showCurrencyButton.bottomAnchor.constraint(equalTo: selectedCurrencyText.bottomAnchor)
        ])
        
        hideTableView()
        
        showCurrencyButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    func setupTableViewDay() {
        dataForCurrency.removeAll()
        currencyTable.reloadData()
    }
    
    func hideTableView() {
        currencyTable.isHidden = true
    }
    
    func hideTextField() {
        selectedCurrencyText.isHidden = true
    }
    
    func showTextField() {
        selectedCurrencyText.isHidden = false
    }
    
    func showTableView() {
        currencyTable.isHidden = false
        currencyTable.separatorStyle = .none
        currencyTable.layer.borderWidth = 1
        currencyTable.layer.cornerRadius = 20
        currencyTable.layer.borderColor = UIColor.sysTrueTFBorder.cgColor
        currencyTable.reloadData()
    }
    
    @objc func buttonTapped() {
        showCurrencyButton.isHidden = true
        showTableView()
        hideTextField()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataForCurrency.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_text".localized, for: indexPath)
        let view = UIView()
        view.backgroundColor = .lightGray
        view.frame.size.height = 1
        view.frame.size.width = cell.frame.width
        cell.addSubview(view)
        cell.backgroundColor = .sysMainWhite
        cell.textLabel?.text = "\(dataForCurrency[indexPath.row])"
        cell.textLabel?.font = UIFont.SFProRegular(size: 12)
        cell.textLabel?.textAlignment = .center
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCurrencyText.text = "\(dataForCurrency[indexPath.row])"
        selectedCurrency = dataForCurrency[indexPath.row]
        hideTableView()
        showTextField()
        showCurrencyButton.isHidden = false
    }
    
    private func validationFromPicker(currency: String) -> Bool {
        let validCurrencies = ["USD", "EUR", "AMD"]
        return validCurrencies.contains(currency.uppercased())
    }
}
