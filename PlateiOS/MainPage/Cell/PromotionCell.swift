//
//  PromotionCell.swift
//  PlateiOS
//
//  Created by Renner Leite Lucena on 11/17/17.
//  Copyright © 2017 Renner Leite Lucena. All rights reserved.
//

import UIKit

class PromotionCell: UITableViewCell {
    //Outlets for cell elements
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var time: UILabel!
    
}

//Extension (for organization) that contains one single function
extension PromotionCell {
    
    // Function that updates the outlet labels
    public func updateLabels(promotionModel: PromotionModel) {
        title.text = promotionModel.title
        location.text = promotionModel.location
        time.text = promotionModel.getTime()
    }
}
