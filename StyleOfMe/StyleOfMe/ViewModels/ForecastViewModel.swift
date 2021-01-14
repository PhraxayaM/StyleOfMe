//
//  ForecastViewModel.swift
//  StyleOfMe
//
//  Created by MattHew Phraxayavong on 1/9/21.
//

import Foundation
struct ForecastViewModel {
    let forecast: Forecast
    
    
    var temp: Float {
        return forecast.temp ?? 0
    }
    
    var temp_min: Float {
        return forecast.temp_min  ?? 0
    }
    
    var temp_max: Float {
        return forecast.temp_max ?? 0
    }
    
}

struct MainViewModel {
    let main: Maintest

    var temp: Float {
        return main.temp ?? 0
    }
    
    var temp_min: Float {
        return main.temp_min  ?? 0
    }
    
    var temp_max: Float {
        return main.temp_max ?? 0
    }
    
    var feels_like: Float? {
        return main.feels_like ?? 0
    }
    
    var pressure: Float? {
        return main.pressure ?? 0
    }
    
    var humidity: Float? {
        return main.humidity ?? 0
    }
//    let temp_min: Float?
//    let temp_max: Float?
//    let pressure: Float?
//    let humidity: Float?
    
}

struct WeatherViewModel2 {
    let forecast: Weathers

    var id: Int {
        return forecast.id ?? 0
    }
    
    var main: String {
        return forecast.main  ?? ""
    }
    
    var description: String {
        return forecast.description ?? ""
    }
    
    var icon: String {
        return forecast.icon ?? ""
    }
    
    
    
}
