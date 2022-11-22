//
//  cellSetup.swift
//  NationalHolidays
//
//  Created by Émerson M Luz on 22/11/22.
//

import UIKit

class CellSetup: UITableViewCell {
    
    @IBOutlet weak var yearLabel: UILabel!
    
    var year: [Int] = Array(1960...2050)
    
    func yearListLoad (index: IndexPath) {
        yearLabel.text = String(year[index.row])
    }
    
}
