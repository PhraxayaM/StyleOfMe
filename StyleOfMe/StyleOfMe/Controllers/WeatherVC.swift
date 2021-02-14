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
    let parser = Parser()
    
    
    private lazy var weatherView: WeatherView = {
        let hv = WeatherView(fontSize: 12)
        return hv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.rgb(red: 175, green: 233, blue: 239)
//        vm.getIt()
        parser.parse {
            data in
            DispatchQueue.main.async {
                self.weatherView.currentTemp.text = String(data.temp)
                let timestamp = DateFormatter.localizedString(from: NSDate() as Date, dateStyle: .medium, timeStyle: .none)
                self.weatherView.currentDate.text = timestamp
            }
        }
        setupView()

    }
    
    private lazy var imageFeed: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(imageLiteralResourceName: "ph3")
        iv.layer.borderWidth = 2
        return iv
    }()

    func setupView() {
        view.addSubview(weatherView)
        view.addSubview(imageFeed)
        
        
        NSLayoutConstraint.activate([imageFeed.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20), imageFeed.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant:  -20), imageFeed.topAnchor.constraint(equalTo: view.topAnchor, constant: 250), imageFeed.heightAnchor.constraint(equalToConstant: 200)])
    }
    
    
    
    
}
