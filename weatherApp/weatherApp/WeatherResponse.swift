//
//  WeatherResponse.swift
//  weatherApp
//
//  Created by Lewis McGrath on 13/11/2017.
//  Copyright © 2017 Lewis McGrath. All rights reserved.
//

import Foundation

//Build out the model objects based on expected JSON

//Think this might be wrong?
struct BaseResponse {
    let weatherResponse : [WeatherMainInfo]
    let dataText : String
    
    
//"List" marker (array) containts these JSON Objects
    struct WeatherMainInfo {
        let temp : Double
        let tempMin : Double
        let tempMax : Double
        let pressure : Double
        let seaLevel : Double
        let grndLevel : Double
        let humidity : Double
        let tempKf : Double
    }

//TODO: Fix. Object with an inner array object
    struct Weather {
        let id : Int
        let main : String
        let description : String
        let icon : String
    }

    struct Clouds {
        let all : Int
    }

    struct Wind {
        let speed : Double
        let deg : Double
    }

    struct sys {
        let pod : String
        }
    }

// Set url that will be used for API call
// Set up request constant that makes a URL Request with the url constant
// Set up the URLsession with a data task and a completion handler
// Set up the task

let url = "http://api.openweathermap.org/data/2.5/forecast?q=London&APPID=296df7e264a3493489577e11f60b9c6b"

let request = URLRequest(url: URL(string: url)!)

let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
    
    guard let data = data else { return }

   let jsonDecoder = JSONDecoder()

}






















