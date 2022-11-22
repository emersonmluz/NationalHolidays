//
//  ViewController.swift
//  NationalHolidays
//
//  Created by Émerson M Luz on 22/11/22.
//

import UIKit

class ViewController: UIViewController {
    
   
    @IBOutlet weak var yearChosseTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        yearChosseTableView.dataSource = self
        
        let url = URL(string: "https://brasilapi.com.br/api/feriados/v1/2022")
        
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
                        
                        let holidays = try decoder.decode([NationalHolidays].self, from: data)
                        
                    } catch let error {
                        print(error)
                    }
                }
            }
            task.resume()
            // Do any additional setup after loading the view.
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CellSetup
        
        cell.yearListLoad(index: indexPath)
        return cell
    }
    
    
}
