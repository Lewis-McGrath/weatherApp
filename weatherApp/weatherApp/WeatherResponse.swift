//
//  WeatherResponse.swift
//  weatherApp
//
//  Created by Lewis McGrath on 15/11/2017.
//  Copyright © 2017 Lewis McGrath. All rights reserved.
//

import Foundation

struct WeatherResponse: Codable {
    
    private enum CodingKeys: String, CodingKey {
        case count = "cnt"
        case list = "list"
        case city = "city"
    }
    
    let count: Float
    let list: [WeatherList]
    let city: City
}

struct City: Codable {
    
    private enum CodingKeys: String, CodingKey{
        case id = "id"
        case name = "name"
        case coordinates = "coord"
        case country = "country"
    }
    let id : Int
    let name : String
    let coordinates : Coord
    let country : String
}

struct Coord: Codable {
    
    private enum CodingKeys: String, CodingKey{
        case latitude = "lat"
        case longitude = "lon"
    }
    
    let latitude: Float
    let longitude: Float
}

// MARK: The main weather response I would display to the user.
struct WeatherList: Codable {
    
    private enum CodingKeys: String, CodingKey {
        case main = "main"
        case weather = "weather"
        case clouds = "clouds"
        case wind = "wind"
        case sys = "sys"
        case dateText = "dt_txt"
        case date = "dt"
    }
    
    let main: MainWeather
    let weather: [Weather]
    let clouds: Clouds
    let wind: Wind
    let sys: Sys
    let dateText: String
    let date: TimeInterval
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
