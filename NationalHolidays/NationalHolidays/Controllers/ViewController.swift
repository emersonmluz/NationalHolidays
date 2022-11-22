//
//  ViewController.swift
//  NationalHolidays
//
//  Created by Émerson M Luz on 22/11/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
                        
                        for holiday in holidays {
                            print(holiday)
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
}

