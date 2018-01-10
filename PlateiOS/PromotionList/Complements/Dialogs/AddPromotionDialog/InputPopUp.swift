//
//  InputPopUp.swift
//  PlateiOS
//
//  Created by Renner Leite Lucena on 1/8/18.
//  Copyright © 2018 Renner Leite Lucena. All rights reserved.
//

import UIKit

class InputPopUp: UIView {
    
    @IBOutlet weak var title: UITextField! {
        didSet {
            let contentView = UIView(frame: CGRect(x: 10, y: 0, width: 30, height: 20))
            
            title.leftViewMode = UITextFieldViewMode.always
            title.leftView = contentView
        }
    }
    @IBOutlet weak var startTime: UITextField! {
        didSet {
            let contentView = UIView(frame: CGRect(x: 10, y: 0, width: 30, height: 20))
            
            startTime.leftViewMode = UITextFieldViewMode.always
            startTime.leftView = contentView
        }
    }
    
    @IBOutlet weak var endTime: UITextField! {
        didSet {
            let contentView = UIView(frame: CGRect(x: 10, y: 0, width: 30, height: 20))
            
            endTime.leftViewMode = UITextFieldViewMode.always
            endTime.leftView = contentView
        }
    }
    
    @IBOutlet weak var location: UITextField! {
        didSet {
            let contentView = UIView(frame: CGRect(x: 10, y: 0, width: 30, height: 20))
            
            location.leftViewMode = UITextFieldViewMode.always
            location.leftView = contentView
        }
    }
    
    @IBAction func negativeClicked(_ sender: Any) {
        negativeFunction?()
    }
    
    @IBAction func positiveClicked(_ sender: Any) {
        let promotionModel = PromotionModel(promotion_id: "", title: title.text!, start_time: startTime.text!, end_time: endTime.text!, location: location.text!)
        positiveFunction?(promotionModel)
    }
    
    @IBOutlet weak var negativeButton: UIButton! {
        didSet {
            negativeButton.setTitleColor(PlateColors.darkerGray, for: .normal)
        }
    }
    
    @IBOutlet weak var positiveButton: UIButton! {
        didSet {
            positiveButton.setTitleColor(PlateColors.mainGreen, for: .normal)
        }
    }
    
    var negativeFunction: (() -> Void)?
    var positiveFunction: ((PromotionModel) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 4
        clipsToBounds = true
    }
}
