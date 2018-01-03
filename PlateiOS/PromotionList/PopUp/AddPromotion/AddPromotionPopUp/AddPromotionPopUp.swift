//
//  AddPromotionPopUp.swift
//  PlateiOS
//
//  Created by Nick Machado on 12/30/17.
//  Copyright © 2017 Renner Leite Lucena. All rights reserved.
//

import Foundation

import UIKit

class AddPromotionPopUp: UIView {
    
    var addPromotionController: AddPromotionController? = nil
    
    @IBOutlet weak var eventName: UITextField!
    @IBOutlet weak var startTime: UITextField!
    @IBOutlet weak var endTime: UITextField!
    @IBOutlet weak var eventLocation: UITextField!
    
    var closeFunction: (() -> Void)?
    
    @IBAction func cancelClicked(_ sender: Any) {
        closeFunction?()
    }
    
    @IBAction func confirmClicked(_ sender: Any) {
        addPromotionController?.tryToAddPromotion(eventName: eventName.text ?? "", eventStartTime: startTime.text ?? "", eventEndTime: endTime.text ?? "", eventLocation: eventLocation.text ?? "")
        closeFunction?()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 20
        clipsToBounds = true
    }
}

extension AddPromotionPopUp: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
}

