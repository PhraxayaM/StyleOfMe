//
//  ArticlesViewModel.swift
//  StyleOfMe
//
//  Created by MattHew Phraxayavong on 1/8/21.
//

import Foundation

class ArticlesViewModel {
    
    
    var newsVM = [NewsViewModel]()
    
    let reuseID = "news"
    
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
