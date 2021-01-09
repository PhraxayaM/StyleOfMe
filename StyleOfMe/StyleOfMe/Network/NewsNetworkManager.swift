//
//  NewsNetworkManager.swift
//  StyleOfMe
//
//  Created by MattHew Phraxayavong on 1/8/21.
//

import Foundation

class NewsNetworkManager {
    static let shared = NewsNetworkManager()
    let imageCache = NSCache<NSString, NSData>()
    
    private let baseURL = "https://newsapi.org/v2/"
    private let USTopHeadline = "top-headlines?country=us"
    func getNews(completion: @escaping([Articles]?) -> Void) {
        let urlString = "\(baseURL)\(USTopHeadline)&apiKey=\(NetworkProperties.newsKey)"
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard err == nil, let data = data else {
                completion(nil)
                return
            }
            
            let newsArticles = try? JSONDecoder().decode(ArticlesModel.self, from: data)
            newsArticles == nil ? completion(nil) : completion(newsArticles?.articles)
        }.resume()
    }
    
    func getImage(urlString: String, completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: urlString) else {
            return
        }
        
        if let cachedImage = imageCache.object(forKey: NSString(string: urlString)) {
            completion(cachedImage as Data)
        } else {
            URLSession.shared.dataTask(with: url) { (data, response, err) in
                guard err == nil, let data = data else {
                    completion(nil)
                    return
                }
                self.imageCache.setObject(data as NSData, forKey: NSString(string: urlString))
                completion(data)
            }.resume()
        }
    }
}
