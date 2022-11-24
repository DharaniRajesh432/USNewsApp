//
//  Webservices.swift
//  USNewsApp
//
//  Created by dharani rajesh on 24/11/22.
//

import Foundation

class Webservices {
    
    func getArticles(url:URL, completion:@escaping ([Article]?)-> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }
            else if let data = data {
                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                if let articleList = articleList {
                    print(articleList.articles)
                    completion(articleList.articles)
                }
            }
        }.resume()
    }
}
