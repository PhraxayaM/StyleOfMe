//
//  WeatherNetworkManager.swift
//  StyleOfMe
//
//  Created by MattHew Phraxayavong on 1/9/21.
//

import Foundation

class WeatherNetworkManager {
    
    static let shared = WeatherNetworkManager()
    
    private let baseUrlString = "https://api.openweathermap.org/data/2.5/weather?q=sacramento&appid=\(NetworkProperties.weatherKey)"
    
    func getWeather(completion: @escaping (Maintest?) -> Void) {
        let urlString = "\(baseUrlString)"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil, let data = data else {
                completion(nil)
                return
            }
            
            let forecast = try? JSONDecoder().decode(WeatherTestModel.self, from: data)
            forecast == nil ? completion(nil) : completion(forecast?.main)
            
        }.resume()
    }
    
}
