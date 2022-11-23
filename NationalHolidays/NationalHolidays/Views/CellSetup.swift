//
//  cellSetup.swift
//  NationalHolidays
//
//  Created by Émerson M Luz on 22/11/22.
//

import UIKit

class CellSetup: UITableViewCell {
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var dayWeekLabel: UILabel!
    @IBOutlet weak var holidayLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var miniCalendarView: UIView!
    var dateFormatInDayOfTheWeek = DateFormatter()
    var dateFormatDay = DateFormatter()
    var dateFormatMonth = DateFormatter()
    
    func showHoliday (base: [NationalHolidays], index: Int) {
        
        miniCalendarView.layer.cornerRadius = 5
        
        dateFormatInDayOfTheWeek.dateFormat = "EEEE"
        dateFormatDay.dateFormat = "dd"
        dateFormatMonth.dateFormat = "MMM"
        
        monthLabel.text = dateFormatMonth.string(from: base[index].date)
        dayLabel.text = dateFormatDay.string(from: base[index].date)
        dayWeekLabel.text = dateFormatInDayOfTheWeek.string(from: base[index].date)
        holidayLabel.text = base[index].name
    }
    
}
