//
//  EventsCell.swift
//  PlateiOS
//
//  Created by Renner Leite Lucena on 11/17/17.
//  Copyright © 2017 Renner Leite Lucena. All rights reserved.
//

import UIKit

class EventsCell: UITableViewCell {

    @IBOutlet weak var Event: UILabel!
    @IBOutlet weak var Location: UILabel!
    @IBOutlet weak var Time: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    fileprivate func updateLabels(eventModel : EventModel?) {
        Event.text = eventModel?.eventName
        Location.text = eventModel?.locationName
        Time.text = eventModel?.time
    }    
}
