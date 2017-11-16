//
//  ViewController.swift
//  weatherApp
//
//  Created by Lewis McGrath on 13/11/2017.
//  Copyright © 2017 Lewis McGrath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = "http://api.openweathermap.org/data/2.5/forecast?q=London&APPID=296df7e264a3493489577e11f60b9c6b"
        let request = URLRequest(url: URL(string: url)!)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let responseData = data else { return }
            
            let jsonDecoder = JSONDecoder()
            do {
                
                let model = try jsonDecoder.decode(WeatherResponse.self, from: responseData)
                print(model.city)
            } catch {
                print(error)
            }
        }
        
        task.resume()
    }
}
