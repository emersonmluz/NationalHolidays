//
//  ViewController.swift
//  NationalHolidays
//
//  Created by Émerson M Luz on 22/11/22.
//

import UIKit

class ViewController: UIViewController {
    
   
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var calendar: [NationalHolidays]?
    var year: Int = 2022
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = "Feriados \(year)"
        tableView.dataSource = self
        tableView.delegate = self
        
        loadCalendar()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextYearButtonClick(_ sender: UIButton) {
        year += 1
        chooseYear()
        loadCalendar()
    }
    
    @IBAction func previousYearButtonClick(_ sender: UIButton) {
        year -= 1
        chooseYear()
        loadCalendar()
    }
    
    func chooseYear () {
        titleLabel.text = "Feriados \(year)"
    }
    
    func loadCalendar () {
        let url = URL(string: "https://brasilapi.com.br/api/feriados/v1/\(year)")
        
        if let url = url {
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("aplication/json", forHTTPHeaderField: "Content-Type")
            
            let session = URLSession.shared
            
            let task = session.dataTask(with: request) { data, response, error in
                if let data = data, error == nil {
                    
                    do {
                        let dateFormat = DateFormatter()
                        dateFormat.dateFormat = "yyyy-MM-dd"
                        
                        let decoder = JSONDecoder()
                        decoder.dateDecodingStrategy = .formatted(dateFormat)
                        
                        self.calendar = try decoder.decode([NationalHolidays].self, from: data)
                        
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                            ScreenLoad.stopLoad(self.tableView)
                        }
                        
                    } catch let error {
                        print(error)
                    }
                }
            }
            task.resume()
            ScreenLoad.startLoad(self.tableView)
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calendar?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CellSetup
        
        if calendar != nil {
            cell.showHoliday(base: calendar ?? [], index: indexPath.row)
        }
           
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
