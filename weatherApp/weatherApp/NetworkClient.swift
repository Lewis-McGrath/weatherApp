//
//  NetworkClient.swift
//  weatherApp
//
//  Created by Lewis McGrath on 11/01/2018.
//  Copyright © 2018 Lewis McGrath. All rights reserved.
//

import Foundation

class NetworkClient {
    
    func getData(completionHandler: @escaping (WeatherResponse) -> Swift.Void) {
        
        let url = "http://api.openweathermap.org/data/2.5/forecast?q=London&APPID=296df7e264a3493489577e11f60b9c6b"
        let request = URLRequest(url: URL(string: url)!)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let responseData = data else { return }
            
            let jsonDecoder = JSONDecoder()
            do {
                let model = try jsonDecoder.decode(WeatherResponse.self, from: responseData)
                completionHandler(model)
               // print(model)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
