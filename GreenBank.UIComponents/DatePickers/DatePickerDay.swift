//
//  DatePickerDay.swift
//  GreenBank.UIComponents
//
//  Created by Eprem Sargsyan on 24.01.24.
//

import UIKit

public class DatePickerDay:  UIView, UITableViewDataSource, UITableViewDelegate {
    
    var dataForDay: [Int] = []
    public var showDaysButton: UIButton
    public var selectedDayText: TextFieldDate
    var daysTable: UITableView
    var selectedDay: Int
    
    public init(imageName: String,
                placeholder: String) {
        
        showDaysButton = UIButton()
        selectedDayText = TextFieldDate(placeholder: placeholder, image: UIImage(systemName: imageName)!)
        daysTable = UITableView()
        selectedDay = 0
        
        super.init(frame: .zero)
        
        setupTableViewDay(selectedMonth: "", selectedYear: 2024)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        daysTable.delegate = self
        daysTable.dataSource = self
        daysTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell_text".localized)
        
        selectedDayText.translatesAutoresizingMaskIntoConstraints = false
        daysTable.translatesAutoresizingMaskIntoConstraints = false
        showDaysButton.translatesAutoresizingMaskIntoConstraints = false
        
        selectedDayText.layer.cornerRadius = 21
        selectedDayText.layer.masksToBounds = true
        
        showDaysButton.layer.borderColor = UIColor.gray.cgColor
        
        self.addSubview(selectedDayText)
        self.addSubview(daysTable)
        self.addSubview(showDaysButton)
        
        showDaysButton.backgroundColor = .none
        
        NSLayoutConstraint.activate([
            selectedDayText.topAnchor.constraint(equalTo: self.topAnchor),
            selectedDayText.leftAnchor.constraint(equalTo: self.leftAnchor),
            selectedDayText.rightAnchor.constraint(equalTo: self.rightAnchor),
            selectedDayText.heightAnchor.constraint(equalToConstant: 42)
        ])
        
        NSLayoutConstraint.activate([
            daysTable.topAnchor.constraint(equalTo: selectedDayText.topAnchor),
            daysTable.leftAnchor.constraint(equalTo: selectedDayText.leftAnchor),
            daysTable.rightAnchor.constraint(equalTo: selectedDayText.rightAnchor),
            daysTable.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            showDaysButton.topAnchor.constraint(equalTo: selectedDayText.topAnchor),
            showDaysButton.rightAnchor.constraint(equalTo: selectedDayText.rightAnchor),
            showDaysButton.leftAnchor.constraint(equalTo: selectedDayText.leftAnchor),
            showDaysButton.bottomAnchor.constraint(equalTo: selectedDayText.bottomAnchor)
        ])
        
        hideTableView()
        
        showDaysButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    func setupTableViewDay(selectedMonth: String, selectedYear: Int = 2024) {
        let end = ValidDayCount(selectedMonth: selectedMonth, selectedYear: selectedYear)
        
        dataForDay.removeAll()
        
        for i in 1...end {
            dataForDay.append(i)
        }
        
        daysTable.reloadData()
    }
    
    func hideTableView() {
        daysTable.isHidden = true
    }
    
    func hideTextField() {
        selectedDayText.isHidden = true
    }
    
    func showTextField() {
        selectedDayText.isHidden = false
    }
    
    func showTableView() {
        daysTable.isHidden = false
        daysTable.separatorStyle = .none
        daysTable.layer.borderWidth = 1
        daysTable.layer.cornerRadius = 20
        daysTable.layer.borderColor = UIColor.sysTrueTFBorder.cgColor
        daysTable.reloadData()
    }
    
    @objc func buttonTapped() {
        showDaysButton.isHidden = true
        showTableView()
        hideTextField()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataForDay.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_text".localized, for: indexPath)
        cell.textLabel?.text = "\(dataForDay[indexPath.row])"
        cell.textLabel?.textAlignment = .center
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedDayText.text = "\(dataForDay[indexPath.row])"
        selectedDay = dataForDay[indexPath.row]
        hideTableView()
        showTextField()
        showDaysButton.isHidden = false
    }
    
    func isLeapYear(_ year: Int) -> Bool {
        return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)
    }
    
    func ValidDayCount(selectedMonth: String, selectedYear: Int) -> Int {
        var dictionary: [String : Int] = [:]
        dictionary["january_text".localized] = 31
        dictionary["march_text".localized] = 31
        dictionary["april_text".localized] = 30
        dictionary["may_text".localized] = 31
        dictionary["june_text".localized] = 30
        dictionary["july_text".localized] = 31
        dictionary["august_text".localized] = 31
        dictionary["september_text".localized] = 30
        dictionary["october_text".localized] = 31
        dictionary["november_text".localized] = 30
        dictionary["december_text".localized] = 31
        
        if isLeapYear(selectedYear) {
            dictionary["february_text".localized] = 29
        } else {
            dictionary["february_text".localized] = 28
        }
        
        if dictionary[selectedMonth] != nil {
            return dictionary[selectedMonth]!
        } else {
            return 31
        }
    }
}
