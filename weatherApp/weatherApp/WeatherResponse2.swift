//
//  WeatherResponse2.swift
//  weatherApp
//
//  Created by Lewis McGrath on 15/11/2017.
//  Copyright © 2017 Lewis McGrath. All rights reserved.
//

import Foundation

struct WeatherResponse2: Codable {
    
    private enum CodingKeys: String, CodingKey {
        case count = "cnt"
        case list = "list"
    }
    
    let count: Float
    let list: [WeatherList]
}

struct WeatherList: Codable {
    
    private enum CodingKeys: String, CodingKey {
        case main = "main"
        case weather = "weather"
        case clouds = "clouds"
        case wind = "wind"
        case sys = "sys"
        case dateText = "dt_txt"
    }
    
    let main: MainWeather
    let weather: [Weather]
    let clouds: Clouds
    let wind: Wind
    let sys: Sys
    let dateText : String
}

struct MainWeather: Codable {
    
    private enum CodingKeys: String, CodingKey {
        case temp = "temp"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure = "pressure"
        case seaLevel = "sea_level"
        case groundLevel = "grnd_level"
        case humidity = "humidity"
        case tempKf = "temp_kf"
    }
    
    let temp: Float
    let tempMin: Float
    let tempMax: Float
    let pressure: Float
    let seaLevel: Float
    let groundLevel : Float
    let humidity: Float
    let tempKf : Float
}

struct Weather: Codable {
    let id: Float
    let main: String
    let description: String
    let icon: String
}

struct Clouds: Codable {
    let all: Float
}

struct Wind: Codable {
    let speed: Float
    let deg : Float
}

struct Sys: Codable{
    let pod : String
}

struct JSON {
    let data = """
    {
    "cod": "200",
    "message": 0.0075,
    "cnt": 40,
    "list": [
    {
    "dt": 1510596000,
    "main": {
    "temp": 276.3,
    "temp_min": 276.062,
    "temp_max": 276.3,
    "pressure": 1032.02,
    "sea_level": 1039.86,
    "grnd_level": 1032.02,
    "humidity": 81,
    "temp_kf": 0.24
    },
    "weather": [
    {
    "id": 801,
    "main": "Clouds",
    "description": "few clouds",
    "icon": "02n"
    }
    ],
    "clouds": {
    "all": 12
    },
    "wind": {
    "speed": 2.36,
    "deg": 298.002
    },
    "sys": {
    "pod": "n"
    },
    "dt_txt": "2017-11-13 18:00:00"
    }
    ]
    
    }
    
    """.data(using: .utf8)!
    
    
    
}






