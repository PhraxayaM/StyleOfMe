//
//  NewsViewModel.swift
//  StyleOfMe
//
//  Created by MattHew Phraxayavong on 1/8/21.
//

import Foundation

struct NewsViewModel {
    let news: Articles
    
    
    var author: String {
        return news.author ?? "Unknown"
    }
    
    var title: String {
        return news.title ?? ""
    }
    
    var description: String {
        return news.url ?? ""
    }
    
    var urlToImage: String {
        return news.urlToImage ?? ""
    }
}
