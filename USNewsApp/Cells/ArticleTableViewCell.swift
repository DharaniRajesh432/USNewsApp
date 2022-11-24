//
//  ArticleTableViewCell.swift
//  USNewsApp
//
//  Created by dharani rajesh on 24/11/22.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    private var ursString: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    
    func setCellWithValues(_ article: ArticleViewModel){
        self.updateUIView(urlToImage: article.urlToImage, author: article.author, description: article.description)
    }
    
    private func updateUIView(urlToImage: String, author: String, description:String){
        self.lblAuthor.text = author
        self.lblDescription.text = description
        
        guard let coverImgUrl = URL(string: urlToImage) else {
            self.imgView.image = UIImage(named: "noImageAvailable")
            return
        }
        self.imgView.image = nil
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
                    self.imgView.image = image
                }
            }
                 
        }.resume()
    }
    
}
