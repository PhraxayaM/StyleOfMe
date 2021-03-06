//
//  WeatherViewModel.swift
//  StyleOfMe
//
//  Created by MattHew Phraxayavong on 1/9/21.
//

import Foundation


class WeatherViewModel {
    
    
    var newsVM = [NewsViewModel]()
    let reuseID = "forecast"
    
    
    func getNews(completion: @escaping ([NewsViewModel]) -> Void ) {
        NewsNetworkManager.shared.getNews { (news) in
            guard let news = news else {return}
            let newsVM = news.map(NewsViewModel.init)
            
            DispatchQueue.main.async {
                self.newsVM = newsVM
                completion(newsVM)
            }
        }
    }
    

}
