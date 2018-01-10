//
//  PromotionListController.swift
//  PlateiOS
//
//  Created by Renner Leite Lucena on 10/20/17.
//  Copyright © 2017 Renner Leite Lucena. All rights reserved.
//

import Foundation
import UIKit

// The controller, which contains all the logic - change to Controller later or see how
// they call it on the internet.
final class PromotionListController {
    
    let promotionListService = PromotionListService()
    var promotionList = PromotionListModel()
    
    let username: String
    unowned let promotionListProtocol: PromotionListProtocol // search about unowned
    
    // init of the controller, with the communication channel to the viewController
    // being the promotionListProtocol
    init(username: String, promotionListProtocol: PromotionListProtocol) {
        self.username = username
        self.promotionListProtocol = promotionListProtocol
    }
}

// Extension for organization
extension PromotionListController {
    
    // Function that initializes our promotionList. Since it communicates with the
    // database, it is better to keep it here instead of inside the list model.
    func initializePromotionList(username: String) {
        promotionListProtocol.showLoading()
        
        promotionListService.readPromotionsToGo(username: username, completionReadPromotionsToGo: { [weak self] success, toGoPromotions in
            self?.handleReadPromotionsToGo(success: success, toGoPromotions: toGoPromotions, username: username)
        })
        
        promotionListProtocol.hideLoading()
    }
    
    func respondToCellButtonClickOnController(promotionModel: PromotionModel, firstClick: Bool) {
        if(firstClick) {
            promotionListService.createRequest(username: username, promotion_id: promotionModel.promotion_id, request_code: "0", completionCreateRequest: { [weak self] success in
                self?.handleCreateRequestGoing(success: success, promotionModel: promotionModel)
            }) // see literal 0
        }else {
            let noFoodDialogViewController = UIStoryboard.init(name: "NoFoodDialog", bundle: nil).instantiateViewController(withIdentifier: "NoFoodDialog") as! NoFoodDialogViewController
            
            noFoodDialogViewController.promotionModel = promotionModel
            noFoodDialogViewController.positiveFunction = { [weak self] in
                self?.promotionListService.createRequest(username: (self?.username)!, promotion_id: promotionModel.promotion_id, request_code: "1", completionCreateRequest: { [weak self] success in
                    self?.handleCreateRequestToGo(success: success, promotionModel: promotionModel)
            })}
            
            promotionListProtocol.presentViewController(controller: noFoodDialogViewController)
        }
    }
    
//    AddPromotionDialogViewController
}

extension PromotionListController {
    
    func handleReadPromotionsToGo(success: Bool, toGoPromotions: [PromotionModel]?, username: String) {
        if(success) {
            for model in toGoPromotions ?? [] { // change this later maybe
                promotionList.promotions.append(model)
                promotionList.promotionsStatus[model] = true
            }
            
            promotionListService.readPromotionsGoing(username: username, completionReadPromotionsGoing: { [weak self] success, goingPromotions in
                self?.handleReadPromotionsGoing(success: success, goingPromotions: goingPromotions)
            })
        }else {
            promotionListProtocol.showErrorMessage(title: "error", message: "something went wrong")
        }
    }
    
    func handleReadPromotionsGoing(success: Bool, goingPromotions: [PromotionModel]?) {
        if(success) {
            for model in goingPromotions ?? [] { // change this later maybe
                promotionList.promotions.append(model)
                promotionList.promotionsStatus[model] = false
            }
            // see dispatch main queue theory - command below should be in the main queue
            promotionListProtocol.loadTable()
        }else {
            promotionListProtocol.showErrorMessage(title: "error", message: "something went wrong")
        }
    }
    
    func handleCreateRequestGoing(success: Bool, promotionModel: PromotionModel) {
        if(success) {
            // maybe the other way - change cell only
            promotionList.promotionsStatus[promotionModel] = false
            promotionListProtocol.reloadTable()
        }else {
            promotionListProtocol.showErrorMessage(title: "error", message: "something went wrong")
        }
    }
    
    func handleCreateRequestToGo(success: Bool, promotionModel: PromotionModel) {
        if(success) {
            promotionList.removePromotion(promotionModel: promotionModel)
            promotionListProtocol.reloadTable()
        }else {
            promotionListProtocol.showErrorMessage(title: "error", message: "something went wrong")
        }
    }
    
    func handleCreatePromotion(success: Bool, promotionModel: PromotionModel) {
        //        if(success) {
        //            promotionList.promotionsStatus[promotionModel] = false
        //            promotionListProtocol.reloadTable()
        //        }else {
        //            promotionListProtocol.showErrorMessage(title: "error", message: "something went wrong")
        //        }
    }
}
