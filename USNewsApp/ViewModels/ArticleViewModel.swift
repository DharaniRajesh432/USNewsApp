//
//  ArticleViewModel.swift
//  USNewsApp
//
//  Created by dharani rajesh on 24/11/22.
//

import Foundation

struct ArticleListViewModel {
    let articles: [Article]
    
    var numberOfSections: Int{
        return 1
    }
    
    func numberOfRowsInSection(section:Int)-> Int {
        return self.articles.count
    }
    
    func cellForRowAt(index: Int)-> ArticleViewModel {
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
    
}

struct ArticleViewModel{
   private let article: Article
}

extension ArticleViewModel{
    init(_ article:Article){
        self.article = article
    }
}

extension ArticleViewModel{
    
    var title:String {
        return self.article.title ?? ""
    }
    
    var author:String {
        return self.article.author ?? ""
    }
    
    var description:String {
        return self.article.description ?? ""
    }
    
    var urlToImage:String {
        return self.article.urlToImage ?? ""
    }
    
    var publishedAt:String {
        return self.article.publishedAt ?? ""
    }
    
    var content:String {
        return self.article.content ?? ""
    }
    
}
