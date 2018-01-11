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
            let contentView = UIView(frame: CGRect(x: 10, y: 0, width: 10, height: 20))
            
            title.clearsOnBeginEditing = false
            title.delegate = self
            title.leftViewMode = UITextFieldViewMode.always
            title.leftView = contentView
        }
    }
    @IBOutlet weak var startTime: UITextField! {
        didSet {
            let contentView = UIView(frame: CGRect(x: 10, y: 0, width: 10, height: 20))
            
            startTime.clearsOnBeginEditing = false
            startTime.delegate = self
            startTime.leftViewMode = UITextFieldViewMode.always
            startTime.leftView = contentView
        }
    }
    
    @IBOutlet weak var endTime: UITextField! {
        didSet {
            let contentView = UIView(frame: CGRect(x: 10, y: 0, width: 10, height: 20))
            
            endTime.clearsOnBeginEditing = false
            endTime.delegate = self
            endTime.leftViewMode = UITextFieldViewMode.always
            endTime.leftView = contentView
        }
    }
    
    @IBOutlet weak var location: UITextField! {
        didSet {
            let contentView = UIView(frame: CGRect(x: 10, y: 0, width: 10, height: 20))
            
            location.clearsOnBeginEditing = false
            location.delegate = self
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
    
    let datePicker = UIDatePicker()
    
    var negativeFunction: (() -> Void)?
    var positiveFunction: ((PromotionModel) -> Void)?
    
    var textFieldDidBeginEditingFunction: (() -> Void)?
    var textFieldDidEndEditingFunction: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 4
        clipsToBounds = true
    }
}

extension InputPopUp: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if(textField == startTime || textField == endTime) {
            showDatePicker(textField: textField)
        }
        textFieldDidBeginEditingFunction?()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if(textField == startTime || textField == endTime) {
            showDatePicker(textField: textField)
        }
        textFieldDidEndEditingFunction?()
    }
}

extension InputPopUp {
    
    func showDatePicker(textField: UITextField) {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: false)
        
        textField.inputAccessoryView = toolbar
        textField.inputView = datePicker
    }
    
    @objc func donePressed() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        
        if(startTime.isFirstResponder) {
            startTime.text = dateFormatter.string(from: datePicker.date)
        }else {
            endTime.text = dateFormatter.string(from: datePicker.date)
        }
        
        textFieldDidEndEditingFunction?()
    }
}

