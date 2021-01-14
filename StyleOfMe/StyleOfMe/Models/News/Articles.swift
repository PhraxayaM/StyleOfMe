//
//  News.swift
//  StyleOfMe
//
//  Created by MattHew Phraxayavong on 1/8/21.
//

import Foundation

struct Articles: Decodable {
    let author: String?
    let title: String?
    let description: String?
    let urlToImage: String?
    let url: String?
}

struct ArticlesModel: Decodable {
    let articles: [Articles]
}
