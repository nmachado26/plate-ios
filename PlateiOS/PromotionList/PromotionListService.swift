//
//  PromotionListService.swift
//  PlateiOS
//
//  Created by Renner Leite Lucena on 12/1/17.
//  Copyright © 2017 Renner Leite Lucena. All rights reserved.
//

import Foundation
import Alamofire

final class PromotionListService {
    private let path = "https://plate-heroku-database.herokuapp.com/"
    var promotionListController: PromotionListController? = nil
    
    func readPromotions(username: String) {
        readPromotionsToGo(username: username)
        // change this in the future, maybe completion
    }
    
    fileprivate func readPromotionsToGo(username: String) {
        Alamofire.request(path + "promotions/read/togo/" + username, method: .get, parameters: nil).responseData { response in
            do {
                var currentToGoPromotions: [PromotionModel] = []
                let arrayPromotions = response.result.value
                currentToGoPromotions = try JSONDecoder().decode([PromotionModel].self, from: arrayPromotions!)
                for model in currentToGoPromotions {
                    self.promotionListController?.promotionList.promotions.append(model)
                    self.promotionListController?.promotionList.promotionsStatus[model] = true
                }
                print("IT HAS RAN THROUGH TOGO METHOD")
                self.readPromotionsGoing(username: username)
                
            } catch{
                print("Error")
            }
            }.resume()
    }
    
    fileprivate func readPromotionsGoing(username: String) {
        Alamofire.request(path + "promotions/read/going/" + username, method: .get, parameters: nil).responseData { response in
            do {
                var currentGoingPromotions: [PromotionModel] = []
                let arrayPromotions = response.result.value
                currentGoingPromotions = try JSONDecoder().decode([PromotionModel].self, from: arrayPromotions!)
                for models in currentGoingPromotions {
                    self.promotionListController?.promotionList.promotions.append(models)
                    self.promotionListController?.promotionList.promotionsStatus[models] = false
                }
                print("IT HAS RAN THROUGH GOING METHOD")
//                DispatchQueue.main.sync {
                self.promotionListController?.promotionListProtocol.loadTable()
//                }
                 print("LOADED TABLE")
                
            }catch {
                print("Error")
            }
            }.resume()
    }
}





//
//    self?.promotionList.promotions = try JSONDecoder().decode([PromotionModel].self, from: data!)
//
//    // This block basically says that, in the main thread of execution,
//    // whenever possible, we should execute the loadTable method, through
//    // the promotionListProtocol channel of communication. Search to understand
//    // better.
//    DispatchQueue.main.sync {
//    self?.promotionListProtocol.loadTable()
//    }
//}catch {
//    print("Error")
//}
//}.resume()
//}

