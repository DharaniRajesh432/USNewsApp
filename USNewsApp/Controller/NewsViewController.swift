//
//  NewsViewController.swift
//  USNewsApp
//
//  Created by dharani rajesh on 24/11/22.
//

import UIKit

class NewsViewController: UITableViewController {
    
    private var viewModel: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let url = URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2022-10-24&sortBy=publishedAt&apiKey=2271f66131ab4e15abc0ba87fb1a4bfd")!
        Webservices().getArticles(url: url) { articles in
            print("Result")
            if let articles = articles {
                self.viewModel = ArticleListViewModel(articles: articles)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel == nil ? 0 : self.viewModel.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel == nil ? 0 : self.viewModel.numberOfRowsInSection(section: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell") as! ArticleTableViewCell
        let articleVM = self.viewModel.cellForRowAt(index: indexPath.row)
        cell.setCellWithValues(articleVM)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let descriptionVC = self.storyboard?.instantiateViewController(withIdentifier: "DescriptionVC") as! DescriptionViewController
        let articleVM = viewModel.cellForRowAt(index: indexPath.row)
        descriptionVC.selectedViewModel = articleVM
        self.navigationController?.pushViewController(descriptionVC, animated: true)
    }
    
}

