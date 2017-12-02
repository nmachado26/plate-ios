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
    
    // promotionList which contains all the data for all the promotions. It is
    // instantiated later as global (so that we can manipulate it in the entire
    // controller).
    var promotionList = PromotionListModel()
    private unowned let promotionListProtocol: PromotionListProtocol
    
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
    func initializePromotionList() {
        let jsonURL = "https://plate-heroku-database.herokuapp.com/promotions"
        let url = URL(string: jsonURL)

        URLSession.shared.dataTask(with: url!) { [weak self] (data, response, error) in
            do {
                self?.promotionList.promotions = try JSONDecoder().decode([PromotionModel].self, from: data!)
                
                // This block basically says that, in the main thread of execution,
                // whenever possible, we should execute the loadTable method, through
                // the promotionListProtocol channel of communication. Search to understand
                // better.
                DispatchQueue.main.sync {
                    self?.promotionListProtocol.loadTable()
                }
            }catch {
                print("Error")
            }
        }.resume()
    }
}
