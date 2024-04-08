//
//  DatePickerView.swift
//  GreenBank.UIComponents
//
//  Created by Eprem Sargsyan on 24.01.24.
//

import UIKit

public class DatePickerView: UIView {
    
    var dateOfBirthLabel = UILabel(text: "date_of_birth_label".localized, textColor: .black, font: UIFont.SFProSemiBold(size: 14))
    
    let currentYear = Calendar.current.component(.year, from: Date())
    
    public lazy var datePickerViewDay = DatePickerDay(imageName: "chevron.down", placeholder: "day_label".localized)
    
    public lazy var datePickerViewMonth = DatePickerMonth(imageName: "chevron.down", placeholder: "month_label".localized,
                                                   day: datePickerViewDay)
    
    public lazy var datePickerViewYear = DatePickerYear(imageName: "chevron.down", placeholder: "year_label".localized,
                                                 currentYear: currentYear, month: datePickerViewMonth)
    
    public lazy var stackView = UIStackView(arrangedSubviews: [datePickerViewDay, datePickerViewMonth, datePickerViewYear],
                                     axis: .horizontal, spacing: 30)
    
    public func setupUI() {
        dateOfBirthLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(dateOfBirthLabel)
        self.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            dateOfBirthLabel.topAnchor.constraint(equalTo: self.topAnchor),
            dateOfBirthLabel.leftAnchor.constraint(equalTo: self.leftAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: dateOfBirthLabel.topAnchor, constant: 20),
            stackView.leftAnchor.constraint(equalTo: self.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: self.rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    public func calculateAge() -> String? {
        
        let day = self.datePickerViewDay.selectedDay
        let month = self.datePickerViewMonth.selectedMont
        let year = self.datePickerViewYear.selectedYear
        
        let dayToString: String?
        let monthToInt: String?
        
        switch month {
        case "January", "Հունվար", "Январь":
            monthToInt = "01"
        case "February", "Փետրվար", "Февраль":
            monthToInt = "02"
        case "March", "Մարտ", "Март":
            monthToInt = "03"
        case "April", "Ապրիլ", "Апрель":
            monthToInt = "04"
        case "May", "Մայիս", "Май":
            monthToInt = "05"
        case "June", "Հունիս", "Июнь":
            monthToInt = "06"
        case "July", "Հուլիս", "Июль":
            monthToInt = "07"
        case "August", "Օգոստոս", "Август":
            monthToInt = "08"
        case "September", "Սեպտեմբեր", "Сентябрь":
            monthToInt = "09"
        case "October", "Հոկտեմբեր", "Октябрь":
            monthToInt = "10"
        case "November", "Նոյեմբեր", "Ноябрь":
            monthToInt = "11"
        case "December", "Դեկտեմբեր", "Декабрь":
            monthToInt = "12"
        default:
            fatalError()
        }
        
        if 10 > day && day > 0 {
            dayToString = "0\(day)"
            return "\(String(describing: dayToString!))-\(String(describing: monthToInt!))-\(year)"
        }
        return "\(day)-\(String(describing: monthToInt!))-\(year)"
    }
    
}

