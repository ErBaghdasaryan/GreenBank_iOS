//
//  DatePickerMonth.swift
//  GreenBank.UIComponents
//
//  Created by Eprem Sargsyan on 24.01.24.
//

import UIKit

public class DatePickerMonth: UIView, UITableViewDataSource, UITableViewDelegate {

    public var showMonthsButton: UIButton
    public var selectedMonthText: TextFieldDate
    var monthsTable: UITableView
    public var selectedMont: String
    var dataForMonth: [String] = []
    
    var selectedMonthInt: Int
    
    var selectedYear: Int
    var day: DatePickerDay
    
    public init(imageName: String,
                placeholder: String,
                day: DatePickerDay) {
        
        showMonthsButton = UIButton()
        selectedMonthText = TextFieldDate(placeholder: placeholder, image: UIImage(systemName: imageName)!)
        monthsTable = UITableView()
        selectedMont = ""
        selectedYear = 0
        selectedMonthInt = 0
        self.day = day

        super.init(frame: .zero)
        
        setupTableViewMonth()
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        monthsTable.delegate = self
        monthsTable.dataSource = self
        monthsTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell_text".localized)

        showMonthsButton.backgroundColor = .none

        selectedMonthText.translatesAutoresizingMaskIntoConstraints = false
        monthsTable.translatesAutoresizingMaskIntoConstraints = false
        showMonthsButton.translatesAutoresizingMaskIntoConstraints = false
        
        selectedMonthText.layer.cornerRadius = 21
        selectedMonthText.layer.masksToBounds = true
        
        showMonthsButton.tintColor = .gray

        self.addSubview(selectedMonthText)
        self.addSubview(monthsTable)
        self.addSubview(showMonthsButton)

        NSLayoutConstraint.activate([
            selectedMonthText.topAnchor.constraint(equalTo: self.topAnchor),
            selectedMonthText.leftAnchor.constraint(equalTo: self.leftAnchor),
            selectedMonthText.rightAnchor.constraint(equalTo: self.rightAnchor),
            selectedMonthText.heightAnchor.constraint(equalToConstant: 42)
        ])

        NSLayoutConstraint.activate([
            monthsTable.topAnchor.constraint(equalTo: selectedMonthText.topAnchor),
            monthsTable.leftAnchor.constraint(equalTo: selectedMonthText.leftAnchor),
            monthsTable.rightAnchor.constraint(equalTo: selectedMonthText.rightAnchor),
            monthsTable.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            showMonthsButton.topAnchor.constraint(equalTo: selectedMonthText.topAnchor),
            showMonthsButton.rightAnchor.constraint(equalTo: selectedMonthText.rightAnchor),
            showMonthsButton.leftAnchor.constraint(equalTo: selectedMonthText.leftAnchor),
            showMonthsButton.bottomAnchor.constraint(equalTo: selectedMonthText.bottomAnchor)
        ])
        
        setupTableViewMonth()

        hideTableView()

        showMonthsButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        showMonthsButton.isHidden = true
        showTableView()
        hideTextField()
    }
    
    func setupTableViewMonth() {
        dataForMonth = ["january_text".localized,
                        "february_text".localized,
                        "march_text".localized,
                        "april_text".localized,
                        "may_text".localized,
                        "june_text".localized,
                        "july_text".localized,
                        "august_text".localized,
                        "september_text".localized,
                        "october_text".localized,
                        "november_text".localized,
                        "december_text".localized]
    }
    
    func hideTableView() {
        monthsTable.isHidden = true
    }
    
    func hideTextField() {
        selectedMonthText.isHidden = true
    }
    
    func showTextField() {
        selectedMonthText.isHidden = false
    }

    func showTableView() {
        monthsTable.isHidden = false
        monthsTable.separatorStyle = .none
        monthsTable.layer.borderWidth = 1
        monthsTable.layer.cornerRadius = 20
        monthsTable.layer.borderColor = UIColor.sysTrueTFBorder.cgColor
        monthsTable.reloadData()
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataForMonth.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_text".localized, for: indexPath)
        cell.textLabel?.text = dataForMonth[indexPath.row]
        return cell
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedMonthText.text = dataForMonth[indexPath.row]
        selectedMont = dataForMonth[indexPath.row]
        selectedMonthInt = indexPath.row + 1
        day.setupTableViewDay(selectedMonth: selectedMont, selectedYear: selectedYear)
        
        if (day.selectedDayText.text != nil) && (day.dataForDay.last! < day.selectedDay) {
            day.selectedDayText.text = "\(day.dataForDay.last!)"
            day.selectedDay = day.dataForDay.last!
        }
        
        hideTableView()
        showTextField()
        showMonthsButton.isHidden = false
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
