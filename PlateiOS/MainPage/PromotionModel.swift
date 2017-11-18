//
//  CardModel.swift
//  PlateiOS
//
//  Created by Nick Machado on 11/11/17.
//  Copyright © 2017 Renner Leite Lucena. All rights reserved.
//

import Foundation

public struct PromotionModel: Decodable {
    let promotion_id : String
    let title : String
    let start_time : String
    let end_time : String
    let location : String
}

extension PromotionModel {
    init() {
        
    }
}



//eventName = promotion.title
//locationName = promotion.location
//time = "Start: " +  promotion.start_time + " End: " + promotion.end_time

