//
//  weatherTest.swift
//  StyleOfMe
//
//  Created by MattHew Phraxayavong on 1/12/21.
//

import Foundation

struct Weathers: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Maintest: Decodable {
    let temp: Float
    let feels_like: Float
    let temp_min: Float
    let temp_max: Float
    let pressure: Float
    let humidity: Float
}


struct WeatherTest: Decodable {
    let author: String?
    let title: String?
    let description: String?
    let urlToImage: String?
    let url: String?
}

struct WeatherTestModel: Decodable {
    let weather: [Weathers]
    let main: Maintest
}
