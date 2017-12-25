//
//  PromotionCell.swift
//  PlateiOS
//
//  Created by Renner Leite Lucena on 11/17/17.
//  Copyright © 2017 Renner Leite Lucena. All rights reserved.
//


//splash screen
import UIKit

class PromotionCell: UITableViewCell {
    
    var promotionListController: PromotionListController? = nil
    var promotionModel: PromotionModel? = nil
    var availability: Bool? = nil
    
    //Outlets for cell elements
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var buttonObj: UIButton! {
        didSet {
            buttonObj.titleLabel?.textAlignment = NSTextAlignment.center
        }
    }
    
    @IBAction func goButton(_ sender: Any) {
        
        // Allows user to confirm they are going and creates a distinction between confirmed xibs. Use guard let later.
        if(availability!) {
            buttonObj.setTitle("IS THE FOOD OVER?", for: .normal)
            buttonObj.setTitleColor(PlateColors.mainGray, for: .normal)
            self.availability = false
        }else {
            //Update calls once the database says there is no food left. No database information for this yet to retrieve, so I just have it set as the second click.
            promotionListController?.promotionList.removePromotion(promotionModel: promotionModel!)
            promotionListController?.promotionListProtocol.reloadTable()
        }
    }
}

// Extension (for organization) that contains one single function
extension PromotionCell {
    
    // Function that updates the outlet labels
    public func updateLabels(promotionModel: PromotionModel, availability: Bool) {
        title.text = promotionModel.title
        location.text = promotionModel.location
        time.text = promotionModel.getTime()
        
        self.availability = availability
        self.promotionModel = promotionModel
        
        if(availability) {
            buttonObj.setTitle("GOING!", for: .normal)
            buttonObj.setTitleColor(PlateColors.mainGreen, for: .normal)
        }else {
//            buttonObj.titleLabel?.lineBreakMode //.numberOfLines = 0;
            buttonObj.setTitle("IS THE FOOD OVER?", for: .normal)
            buttonObj.setTitleColor(PlateColors.mainGray, for: .normal)
        }
    }
}
