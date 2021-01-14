//
//  WeatherModel.swift
//  StyleOfMe
//
//  Created by MattHew Phraxayavong on 1/9/21.
//

import Foundation

struct Weather: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Main: Decodable {
    let temp: Float?
    let feels_like: Float?
    let temp_min: Float?
    let temp_max: Float?
    let pressure: Float?
    let humidity: Float?
}

struct Sys: Decodable {
    let country: String?
    let sunrise: Int?
    let sunset: Int?
}

struct WeatherModel: Decodable {
    let weather: [Weather]
    let main: [Main]
    let sys: Sys
    let name: String?
    let dt: Int
    let timezone: Int?
    let dt_txt: String?
}

struct ForecastModel: Decodable {
    var list: [WeatherModel]
    let city: City
}

struct City: Decodable {
    let name: String?
    let country: String?
    
}
