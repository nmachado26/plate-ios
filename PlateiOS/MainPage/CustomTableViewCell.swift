//
//  CustomTableViewCell.swift
//  PlateiOS
//
//  Created by Nick Machado on 11/4/17.
//  Copyright © 2017 Renner Leite Lucena. All rights reserved.
//

import UIKit
import Alamofire

class CustomTableViewCell: UITableViewCell {

    //MARK: Properties
    
    @IBOutlet weak var time: UILabel!
    @IBAction func buttonClickAction(_ sender: Any) {
    }
    
    @IBOutlet weak var actionButton: UIButton!
    

    
    @IBOutlet weak var locationName: UILabel!
    
    @IBOutlet weak var eventName: UILabel!
    
    var cardModel: CardModel? {
        didSet {
            updateLabels()
        }
    }
    
    fileprivate func updateLabels() {
        time.text = cardModel?.time
        locationName.text = cardModel?.locationName
        eventName.text = cardModel?.eventName
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
