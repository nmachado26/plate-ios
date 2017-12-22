//
//  PromotionListController.swift
//  PlateiOS
//
//  Created by Renner Leite Lucena on 10/20/17.
//  Copyright © 2017 Renner Leite Lucena. All rights reserved.
//

import Foundation

// The controller, which contains all the logic - change to Controller later or see how
// they call it on the internet.
final class PromotionListController {
    
    let promotionListService = PromotionListService()
    var promotionList = PromotionListModel()
    unowned let promotionListProtocol: PromotionListProtocol
    
    // init of the controller, with the communication channel to the viewController
    // being the promotionListProtocol
    init(promotionListProtocol: PromotionListProtocol) {
        self.promotionListProtocol = promotionListProtocol
    }
}

// Extension for organization
extension PromotionListController {
    
    // Function that initializes our promotionList. Since it communicates with the
    // database, it is better to keep it here instead of inside the list model.
    func initializePromotionList(username: String) {
        promotionListService.promotionListController = self
        promotionListService.readPromotionsToGo(username: username)
//        DispatchQueue.main.sync {
//            self.promotionListProtocol.loadTable()
//        }
    }
}

