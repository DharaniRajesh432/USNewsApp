//
//  DescriptionViewController.swift
//  USNewsApp
//
//  Created by dharani rajesh on 24/11/22.
//

import UIKit

class DescriptionViewController: UIViewController {
    
    var selectedViewModel: ArticleViewModel!
    @IBOutlet weak var descriptionTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Description"
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    @IBAction func backBtnClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension DescriptionViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DescpTableViewCell") as! DescpTableViewCell
        cell.lblTitle.text =   self.selectedViewModel.author
        cell.lblDescription.text =   self.selectedViewModel.description
        cell.setCellWithValues(self.selectedViewModel)
        cell.lblPublishedAt.text =   self.selectedViewModel.publishedAt
        cell.lblContent.text =   self.selectedViewModel.content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
    }
}
