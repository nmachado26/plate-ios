//
//  ConfirmationPopUp.swift
//  PlateiOS
//
//  Created by Nick Machado on 12/25/17.
//  Copyright © 2017 Renner Leite Lucena. All rights reserved.
//

import UIKit

class ConfirmationPopUp: UIView {

    //CA3B33 - RGB - 202,59,51
    
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
        //if want to set color manually
      //  eventLabel.textColor = getColorByHex(rgbHexValue: 0xCA3B33, alpha: 0.9)
    }
    
   // signupButton.setTitleColor(getColorByHex(0xCA3B33, alpha: 0.9), forState: .Normal)
    
    //changes hexColor to UIColor
    func getColorByHex(rgbHexValue:UInt32, alpha:Double = 1.0) -> UIColor {
        let red = Double((rgbHexValue & 0xFF0000) >> 16) / 256.0
        let green = Double((rgbHexValue & 0xFF00) >> 8) / 256.0
        let blue = Double((rgbHexValue & 0xFF)) / 256.0
        return UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alpha))
    }
}
