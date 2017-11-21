//
//  PromotionListModel.swift
//  PlateiOS
//
//  Created by Renner Leite Lucena on 11/17/17.
//  Copyright © 2017 Renner Leite Lucena. All rights reserved.
//

import Foundation

// Our list model, one containing all the promotions models, all the data that we need for the table view.
class PromotionListModel {
    
    var promotions: [PromotionModel]
    
    // Empty init, only to have one. We actually initialize it when we do the JSON
    // parsing.
    init() {
        promotions = []
    }
}

// Extension for organization
extension PromotionListModel {
    
    // Funtion that returns the total number of items in the promotions array.
    public func quantityOfItems() -> Int {
        return promotions.count
    }
}
