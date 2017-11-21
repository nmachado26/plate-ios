//
//  PromotionListDataSource.swift
//  PlateiOS
//
//  Created by Renner Leite Lucena on 11/20/17.
//  Copyright © 2017 Renner Leite Lucena. All rights reserved.
//

import Foundation
import UIKit

final class PromotionListDataSource : NSObject {
    // Reference to the presenter that we need here to access the promotionsList
    public var rootPresenter: RootPresenter?
}

// See that this extension basically implements a protocol, ones that is standard for
// tableViews, necessary to make it work.
extension PromotionListDataSource : UITableViewDataSource {
    
    // We only need one section in our table
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // We need as many rows as the quantityOfItems in our promotionsList model, one that
    // we can access because of our presenter reference. The guard let basically makes
    // sure that we have a not null value associalted to the quantityOfItems, returning 0
    // if that's the case. Search to understand better (I can explain more about it
    // later).
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let quantityOfItems = rootPresenter?.promotionList.quantityOfItems() else {
            return 0
        }
    
        return quantityOfItems
    }
    
    // Basically changes the default cell of the table view for the xib's one
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let promotionModel = rootPresenter?.promotionList.promotions[indexPath.row] else { return UITableViewCell() }
        guard let tableCell = tableView.dequeueReusableCell(withIdentifier: "PromotionCell", for: indexPath) as? PromotionCell else { return UITableViewCell() }
        tableCell.updateLabels(promotionModel: promotionModel)
        return tableCell
    }
}