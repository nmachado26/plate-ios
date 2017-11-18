//
//  PromotionList.swift
//  PlateiOS
//
//  Created by Renner Leite Lucena on 11/17/17.
//  Copyright © 2017 Renner Leite Lucena. All rights reserved.
//

import Foundation

struct PromotionList {
    public var promotions: [PromotionModel]
}

extension PromotionList {
    public init(data: Data?) {
        let jsonURL = "https://plate-heroku-database.herokuapp.com/promotions"
        let url = URL(string: jsonURL)
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do {
                self.promotions = try JSONDecoder().decode([PromotionModel].self, from: data!)
            } catch{
                print("URL")
            }
            }.resume()
    }
}
