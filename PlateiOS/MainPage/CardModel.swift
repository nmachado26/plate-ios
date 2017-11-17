//
//  CardModel.swift
//  PlateiOS
//
//  Created by Nick Machado on 11/11/17.
//  Copyright © 2017 Renner Leite Lucena. All rights reserved.
//

import Foundation

struct CardModel {
    
    public var eventName: String
    public let locationName: String
    public let time : String
}

extension CardModel {
    
    public init(promotion: Promotion) {
        eventName = promotion.title
        locationName = promotion.location
        time = "Start: " +  promotion.start_time + " End: " + promotion.end_time
    }
}


