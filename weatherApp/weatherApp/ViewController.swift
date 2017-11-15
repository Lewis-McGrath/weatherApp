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
        let myData = JSON()
        
        let decoder = JSONDecoder()
        do {
            
            let model = try decoder.decode(WeatherResponse2.self, from: myData.data)
            print(model.list.first ?? "nothing to print")
            
        } catch {
            print(error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

