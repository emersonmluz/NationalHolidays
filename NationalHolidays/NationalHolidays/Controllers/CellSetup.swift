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
    
    func showHoliday (base: [NationalHolidays]) {
        dayLabel.text = "01"
        dayWeekLabel.text = "segunda"
        holidayLabel.text = base[0].name
        print(base)
    }
    
}
