//
//  Forecast.swift
//  StyleOfMe
//
//  Created by MattHew Phraxayavong on 1/9/21.
//

import Foundation

struct Forecast: Decodable {
    let temp: Float
    let temp_min: Float
    let temp_max: Float

}

struct ForecastTemperature {
    let weekDay: String?
    let hourlyForecast: [Forecast]?
}
