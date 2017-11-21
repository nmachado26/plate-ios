//
//  CardModel.swift
//  PlateiOS
//
//  Created by Nick Machado on 11/11/17.
//  Copyright © 2017 Renner Leite Lucena. All rights reserved.
//

import Foundation

// Our promotionModel, one for each event/promotion.
class PromotionModel: Decodable {
    
    var promotion_id : String
    var title : String
    var start_time : String
    var end_time : String
    var location : String
    
    // The inits can be in the declaration of the class (not necesssary to have extension for this)
    init(promotion_id: String, title: String, start_time: String, end_time: String, location: String) {
        self.promotion_id = promotion_id
        self.title = title
        self.start_time = start_time
        self.end_time = end_time
        self.location = location
    }
}

// Extension for organization
extension PromotionModel {
    
    // Single function that returns a string with the start and end times.
    public func getTime() -> String {
        return ("Start: " +  self.start_time + " End: " + self.end_time)
    }
}

