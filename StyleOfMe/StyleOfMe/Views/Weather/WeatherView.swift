//
//  WeatherView.swift
//  StyleOfMe
//
//  Created by MattHew Phraxayavong on 1/9/21.
//

import UIKit
class WeatherView: UIView {
   
    private var fontSize: CGFloat
    
    
    var forecastVM: ForecastViewModel? {
        didSet {
            if let forecastVM = forecastVM {
                currentTemp.text = String(forecastVM.temp)
                print("currenttemptext", currentTemp.text)
            }
        }
    }
    
    let currentLocation: UILabel = {
           let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Sacramento, CA"
            label.textAlignment = .left
            label.numberOfLines = 0
            label.font = UIFont.systemFont(ofSize: 26, weight: .heavy)
            label.textColor = .white
            return label
        }()
    
    let currentDate: UILabel = {
           let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "...Date"
            label.textAlignment = .left
            label.numberOfLines = 0
            label.font = UIFont.systemFont(ofSize: 26, weight: .heavy)
            label.textColor = .white

            return label
        }()
    
    let currentTemp: UILabel = {
           let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "...Temp"
            label.textAlignment = .left
            label.numberOfLines = 0
            label.font = UIFont.systemFont(ofSize: 26, weight: .heavy)
            label.textColor = .white

            return label
        }()
    
    let tempSymbol: UILabel = {
           let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "...Symbol"
            label.textAlignment = .left
            label.numberOfLines = 0
            label.font = UIFont.systemFont(ofSize: 38, weight: .heavy)
            return label
        }()
    
    let tempDescription: UILabel = {
           let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "...Description"
            label.textAlignment = .left
            label.numberOfLines = 0
            label.font = UIFont.systemFont(ofSize: 38, weight: .heavy)
            return label
        }()
    
    let menuButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "menuicon"), for: .normal)
        return button
    }()
    
    private lazy var dateStack: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [currentDate])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        return sv
    }()
    
    private lazy var tempStack: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [currentTemp])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        return sv
    }()
    
    init(fontSize:CGFloat){
        self.fontSize = fontSize
        super.init(frame: .zero)
        backgroundColor = .red
        addSubview(currentLocation)

        addSubview(dateStack)
        addSubview(tempStack)
        
        
        dateStack.topAnchor.constraint(equalTo: currentLocation.bottomAnchor, constant: 30).isActive = true
        tempStack.leftAnchor.constraint(equalTo: dateStack.rightAnchor, constant: 100).isActive = true
        tempStack.topAnchor.constraint(equalTo: currentLocation.bottomAnchor, constant: 30).isActive = true
        currentLocation.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

