//
//  ConfirmationPopUp.swift
//  PlateiOS
//
//  Created by Nick Machado on 12/25/17.
//  Copyright © 2017 Renner Leite Lucena. All rights reserved.
//

import UIKit

class ConfirmationPopUp: UIView {

    @IBOutlet weak var eventLabel: UILabel!
    
    var closeFunction: (() -> Void)?
    
    @IBAction func cancelClicked(_ sender: Any) {
        closeFunction?()
    }
    
    @IBAction func confirmClicked(_ sender: Any) {
        closeFunction?()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 20
        clipsToBounds = true
    }
    
    
}
