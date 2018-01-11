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
    
    private let path = "https://plate-heroku-database.herokuapp.com/" //TODO: create development
    
    func readPromotionsToGo(username: String, completionReadPromotionsToGo: @escaping (_ success: Bool, _ toGoPromotions: [PromotionModel]?) -> Void) {
        Alamofire.request(path + "promotions/read/togo/" + username, method: .get, parameters: nil).responseData { response in
            do {
                var toGoPromotions: [PromotionModel] = []
                let arrayPromotions = response.result.value
                toGoPromotions = try JSONDecoder().decode([PromotionModel].self, from: arrayPromotions!)
                completionReadPromotionsToGo(true, toGoPromotions)
            }catch {
                completionReadPromotionsToGo(false, nil)
            }
        } // why .resume()??
    }
    
    func readPromotionsGoing(username: String, completionReadPromotionsGoing: @escaping (_ success: Bool, _ toGoPromotions: [PromotionModel]?) -> Void) {
        Alamofire.request(path + "promotions/read/going/" + username, method: .get, parameters: nil).responseData { response in
            do {
                var goingPromotions: [PromotionModel] = []
                let arrayPromotions = response.result.value
                goingPromotions = try JSONDecoder().decode([PromotionModel].self, from: arrayPromotions!)
                completionReadPromotionsGoing(true, goingPromotions)
            }catch {
                completionReadPromotionsGoing(false, nil)
            }
        }
    }
    
    func createRequest(username: String, promotion_id: String, request_code: String, completionCreateRequest: @escaping (_ success: Bool) -> Void) {
        Alamofire.request(path + "requests/create/" + username + "/" + promotion_id + "/" + request_code, method: .post, parameters: nil).responseString { response in
            if let stringResponse = response.result.value {
                let success = (stringResponse == "true")
                completionCreateRequest(success)
            }
        }
    }
    
    func createPromotion(title: String, start_time: String, end_time: String, location: String, completionCreatePromotion: @escaping (_ success: Bool, _ PromotionModel: PromotionModel?) -> Void) {
        let URL = path + "promotions/create/" + title + "/" + start_time + "/" + end_time + "/" + location
        let safeURL = URL.addingPercentEncoding( withAllowedCharacters: .urlQueryAllowed)!
        Alamofire.request(safeURL, method: .post, parameters: nil).responseString { response in
            if let promotion_id = response.result.value {
                let success = (promotion_id != "")
                let promotionModel = success ? PromotionModel(promotion_id: promotion_id, title: title, start_time: start_time, end_time: end_time, location: location) : nil
                completionCreatePromotion(success, promotionModel)
            }
        }
    }
}

