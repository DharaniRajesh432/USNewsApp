//
//  Article.swift
//  USNewsApp
//
//  Created by dharani rajesh on 24/11/22.
//

import Foundation
import UIKit

struct Article:Decodable {
    let title:String?
    let description:String?
    let urlToImage:String?
    let publishedAt:String?
    let content:String?
    
    
    init(title:String, description:String, urlToImage:String, publishedAt:String,content:String){
        self.title = title
        self.description = description
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
        self.content = content
    }
   
}
