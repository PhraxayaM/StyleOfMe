//
//  WeatherVC.swift
//  StyleOfMe
//
//  Created by MattHew Phraxayavong on 1/9/21.
//

import UIKit

class WeatherVC: UIViewController {

    var viewModel = ArticlesViewModel()
    var weathervm = WeatherViewModel()
    
    private lazy var weatherView: WeatherView = {
        let hv = WeatherView(fontSize: 12)
        return hv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.rgb(red: 175, green: 233, blue: 239)
    
        setupView()
        fetchWeather()
//        WeatherNetworkManager.shared.getForecast { (forecast) in
//            print(forecast)
//        }

    }

    func setupView() {
        view.addSubview(weatherView)        
    }

    
    
    func fetchWeather() {
        print("trying")
        weathervm.getWeather { (weather) in
            print("trying getweather", weather)
            DispatchQueue.main.async {
                self.weatherView.currentTemp.text = String(weather.temp)
            }
        }
    }
    
    
    
}
