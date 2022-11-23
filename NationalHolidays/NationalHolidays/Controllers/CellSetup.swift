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
    
    var dateFormatInDayOfTheWeek = DateFormatter()
    var dateFormatDay = DateFormatter()
    
    func showHoliday (base: [NationalHolidays], index: Int) {
        
        dayLabel.layer.cornerRadius = 10
        dayLabel.layer.masksToBounds = true
        
        dateFormatInDayOfTheWeek.dateFormat = "EEEE"
        dateFormatDay.dateFormat = "dd"
        
        dayLabel.text = dateFormatDay.string(from: base[index].date)
        dayWeekLabel.text = dateFormatInDayOfTheWeek.string(from: base[index].date)
        holidayLabel.text = base[index].name
    }
    
}
