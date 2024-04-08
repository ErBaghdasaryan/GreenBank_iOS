//
//  DatePickerYear.swift
//  GreenBank.UIComponents
//
//  Created by Eprem Sargsyan on 24.01.24.
//

import UIKit

public class DatePickerYear: UIView, UITableViewDataSource, UITableViewDelegate {

    var dataForYear: [Int] = []
    public var showYearsButton: UIButton
    public var selectedYearText: TextFieldDate
    var yearsTable: UITableView
    public var selectedYear: Int
    
    var month: DatePickerMonth?

    public init(imageName: String,
                placeholder: String,
                currentYear: Int,
                month: DatePickerMonth) {
        
        showYearsButton = UIButton()
        selectedYearText = TextFieldDate(placeholder: placeholder, image: UIImage(systemName: imageName)!)
        yearsTable = UITableView()
        self.month = month
        selectedYear = 0

        super.init(frame: .zero)
        
        setupTableViewYear(currentYear: currentYear - 18)
        
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        yearsTable.delegate = self
        yearsTable.dataSource = self
        yearsTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell_text".localized)
        selectedYear = 2001
        selectedYearText.translatesAutoresizingMaskIntoConstraints = false
        yearsTable.translatesAutoresizingMaskIntoConstraints = false
        showYearsButton.translatesAutoresizingMaskIntoConstraints = false
        
        selectedYearText.layer.cornerRadius = 21
        selectedYearText.layer.masksToBounds = true
        
        showYearsButton.tintColor = .gray

        self.addSubview(selectedYearText)
        self.addSubview(yearsTable)
        self.addSubview(showYearsButton)
        
        showYearsButton.backgroundColor = .none
        showYearsButton.isUserInteractionEnabled = true

        NSLayoutConstraint.activate([
            selectedYearText.topAnchor.constraint(equalTo: self.topAnchor),
            selectedYearText.leftAnchor.constraint(equalTo: self.leftAnchor),
            selectedYearText.rightAnchor.constraint(equalTo: self.rightAnchor),
            selectedYearText.heightAnchor.constraint(equalToConstant: 42)
        ])

        NSLayoutConstraint.activate([
            yearsTable.topAnchor.constraint(equalTo: selectedYearText.topAnchor),
            yearsTable.leftAnchor.constraint(equalTo: selectedYearText.leftAnchor),
            yearsTable.rightAnchor.constraint(equalTo: selectedYearText.rightAnchor),
            yearsTable.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            showYearsButton.topAnchor.constraint(equalTo: selectedYearText.topAnchor),
            showYearsButton.rightAnchor.constraint(equalTo: selectedYearText.rightAnchor),
            showYearsButton.leftAnchor.constraint(equalTo: selectedYearText.leftAnchor),
            showYearsButton.bottomAnchor.constraint(equalTo: selectedYearText.bottomAnchor)
        ])

        hideTableView()

        showYearsButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    func setupTableViewYear(currentYear: Int) {
        let start = currentYear - 80

        for i in start...currentYear {
            dataForYear.append(i)
        }
        
        dataForYear.reverse()
    }

    func hideTableView() {
        yearsTable.isHidden = true
    }
    
    func hideTextField() {
        selectedYearText.isHidden = true
    }
    
    func showTextField() {
        selectedYearText.isHidden = false
    }

    func showTableView() {
        yearsTable.isHidden = false
        yearsTable.separatorStyle = .none
        yearsTable.layer.borderWidth = 1
        yearsTable.layer.cornerRadius = 20
        yearsTable.layer.borderColor = UIColor.sysTrueTFBorder.cgColor
        yearsTable.reloadData()
    }

    @objc func buttonTapped() {
        showYearsButton.isHidden = true
        showTableView()
        hideTextField()
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataForYear.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_text".localized, for: indexPath)
        cell.textLabel?.text = "\(dataForYear[indexPath.row])"
        cell.textLabel?.textAlignment = .center
        return cell
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedYearText.text = "\(dataForYear[indexPath.row])"
        selectedYear = dataForYear[indexPath.row]
        
        month?.selectedYear = dataForYear[indexPath.row]
        
        month?.day.setupTableViewDay(selectedMonth: month?.selectedMont ?? "", selectedYear: dataForYear[indexPath.row])
        
        if (month?.day.selectedDayText.text != nil) && (month?.day.selectedDay)! > (month?.day.dataForDay.last)! {
            
            
            month?.day.selectedDayText.text = "\(month!.day.dataForDay.last!)"
        }
        
        hideTableView()
        showTextField()
        showYearsButton.isHidden = false
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

