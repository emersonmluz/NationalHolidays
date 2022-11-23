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
    @IBOutlet weak var nextYearButton: UIButton!
    
    var calendar: [NationalHolidays]?
    var year: Int = 2022
    var url = URL(string: "https://brasilapi.com.br/api/feriados/v1/2022")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = "Feriados \(year)"
        tableView.dataSource = self
        
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
                        }
                        
                    } catch let error {
                        print(error)
                    }
                }
            }
            task.resume()
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextYearButtonClick(_ sender: UIButton) {
        year += 1
        chooseYear()
    }
    
    @IBAction func previousYearButtonClick(_ sender: UIButton) {
        year -= 1
        chooseYear()
    }
    
    func chooseYear () {
        titleLabel.text = "Feriados \(year)"
        url = URL(string: "https://brasilapi.com.br/api/feriados/v1/\(year)")
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
