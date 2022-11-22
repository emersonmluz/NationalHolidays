//
//  ViewController.swift
//  NationalHolidays
//
//  Created by Émerson M Luz on 22/11/22.
//

import UIKit

class ViewController: UIViewController {
    
   
    @IBOutlet weak var yearChosseTableView: UITableView!
    
    var calendar: [NationalHolidays] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        yearChosseTableView.dataSource = self
        calendar = HolidaysCalendar.read(year: "2022")
            // Do any additional setup after loading the view.
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 91
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CellSetup
        
        cell.yearListLoad(index: indexPath)
        return cell
    }
    
    
}
