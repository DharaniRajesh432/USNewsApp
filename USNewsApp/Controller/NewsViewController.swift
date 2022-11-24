//
//  NewsViewController.swift
//  USNewsApp
//
//  Created by dharani rajesh on 24/11/22.
//

import UIKit

class NewsViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let url = URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2022-10-24&sortBy=publishedAt&apiKey=2271f66131ab4e15abc0ba87fb1a4bfd")!
        Webservices().getArticles(url: url) { result in
             
        }
         
    }

}

