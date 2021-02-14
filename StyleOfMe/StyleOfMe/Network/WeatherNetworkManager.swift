//
//  WeatherNetworkManager.swift
//  StyleOfMe
//
//  Created by MattHew Phraxayavong on 1/9/21.
//

import Foundation


struct Parser {
    func parse(completion: @escaping (Current)->()) {
        let baseUrlString = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=37.5485&lon=-121.9886&exclude=minutely&appid=\(NetworkProperties.weatherKey)&units=imperial")
        
        URLSession.shared.dataTask(with: baseUrlString!) { (data, response, err) in
            print("here", data)
            if err != nil {
                print(err?.localizedDescription)
                print("error")
                return
            }
            do {
                let result = try JSONDecoder().decode(WeatherModel.self, from: data!)
                completion(result.current)
                print("my weather result", result)
            } catch {
                
            }
        }.resume()
    }
}
