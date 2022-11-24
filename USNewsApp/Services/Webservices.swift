//
//  Webservices.swift
//  USNewsApp
//
//  Created by dharani rajesh on 24/11/22.
//

import Foundation

class Webservices {
    
    func getArticles(url:URL, completion:@escaping ([Any?])-> ()) {
        
        URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            }
            else if let data = data {
                print(data)
            }
            
        })
        
    }
}
