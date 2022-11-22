//
//  cellSetup.swift
//  NationalHolidays
//
//  Created by Émerson M Luz on 22/11/22.
//

import UIKit

class CellSetup: UITableViewCell {
    
    @IBOutlet weak var yearLabel: UILabel!
    
    func yearListLoad () {
        yearLabel.text = "2022"
    }
    
}
