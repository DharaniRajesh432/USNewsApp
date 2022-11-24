//
//  Article.swift
//  USNewsApp
//
//  Created by dharani rajesh on 24/11/22.
//

import Foundation

struct ArticleList:Decodable {
    let articles: [Article]
}

struct Article:Decodable {
    
    let title:String?
    let author:String?
    let description:String?
    let urlToImage:String?
    let publishedAt:String?
    let content:String?
    
    init(title:String, author:String, description:String, urlToImage:String, publishedAt:String,content:String){
        self.title = title
        self.author = author
        self.description = description
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
        self.content = content
    }
    
    enum CodingKeys: String, CodingKey {
        case title, author ,description, urlToImage, publishedAt, content
    }
}
