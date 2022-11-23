//
//  ScreenLoad.swift
//  NationalHolidays
//
//  Created by Émerson M Luz on 23/11/22.
//

import UIKit

class ScreenLoad {
    
    static func startLoad (_ tableView: UITableView) {
        tableView.alpha = 0.25
        tableView.isUserInteractionEnabled = false
    }
    
    static func stopLoad (_ tableView: UITableView) {
        tableView.alpha = 1
        tableView.isUserInteractionEnabled = true
    }
}
