//
//  DescpTableViewCell.swift
//  USNewsApp
//
//  Created by dharani rajesh on 24/11/22.
//

import UIKit

class DescpTableViewCell: UITableViewCell {
    
    //    @IBOutlet weak var lblAuthor:UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var selectedImageView: UIImageView!
    @IBOutlet weak var lblPublishedAt:UILabel!
    @IBOutlet weak var lblContent:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func setCellWithValues(_ article: ArticleViewModel){
        guard let coverImgUrl = URL(string: article.urlToImage) else {
            self.selectedImageView.image = UIImage(named: "noImageAvailable")
            return
        }
        //self.selectedImageView.image = nil
        self.getImageDataFrom(url: coverImgUrl)
    }
    
    private func getImageDataFrom(url: URL){
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let data = data else {
                return
            }
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    self.selectedImageView.image = image
                }
            }
            
        }.resume()
    }
    
}
