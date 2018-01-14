//
//  AddPromotionController.swift
//  PlateiOS
//
//  Created by Nick Machado on 12/30/17.
//  Copyright © 2017 Renner Leite Lucena. All rights reserved.
//

import UIKit
import Foundation

class AddPromotionController: UIViewController {
    
    var promotionListController: PromotionListController? = nil
    
    @IBOutlet weak var addPopUpOnView: UIView!
    @IBOutlet weak var backgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCloseAction()
        setupUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension AddPromotionController {
    
    fileprivate func setupUI() {
        let addPromotionView = AddPromotionPopUp.makeXib()
        showPromotionPopUp(addPromotionView: addPromotionView)
    }
    
    fileprivate func setupCloseAction() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        backgroundView.addGestureRecognizer(tap)
    }
    
    @objc func handleTap() {
        self.dismissAnimated()
    }
    
    public func closePopup() {
        self.dismissAnimated()
    }
}

extension AddPromotionController {
    
    fileprivate func dismissAnimated() {
        self.view.subviews.forEach { $0.removeFromSuperview() }
        
        DispatchQueue.main.async {
            self.dismiss(animated: true)
        }
    }
    
    fileprivate func showPromotionPopUp(addPromotionView: AddPromotionPopUp) {
        addPopUpOnView.addSubview(addPromotionView)
        
        DispatchQueue.main.async {
            self.addConstraintsModelContainer(with: addPromotionView)
            UIView.animate(withDuration: 0.5) { [weak self] in self?.addPopUpOnView.alpha = 1 }
        }
    }
    
    fileprivate func addConstraintsModelContainer(with subview: UIView) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.topAnchor.constraint(equalTo: addPopUpOnView.topAnchor).isActive = true
        subview.bottomAnchor.constraint(equalTo: addPopUpOnView.bottomAnchor).isActive = true
        subview.trailingAnchor.constraint(equalTo: addPopUpOnView.trailingAnchor).isActive = true
        subview.leadingAnchor.constraint(equalTo: addPopUpOnView.leadingAnchor).isActive = true
    }
}

extension AddPromotionController {
    
    //init the message
    fileprivate func setUpMessage(for messageView: AddPromotionPopUp) {
        messageView.closeFunction = { [weak self] in
            self?.closePopup()
        }
        // messageView.eventLabel.text = eventName
    }
}

//create new promotion
extension AddPromotionController {
    
    func showErrorMessage(title : String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        present(alert, animated: true, completion: nil)
    }
    
    func tryToAddPromotion(eventName: String, eventStartTime: String, eventEndTime: String, eventLocation:String) {
        if(eventName == "" || eventStartTime == "" || eventEndTime == "" || eventLocation == "") {
            showErrorMessage(title: "error", message: "Missing input")
        }
        else{
            //create PromotionModel object named model
            let model: PromotionModel = PromotionModel.init(promotion_id: "id", title: eventName, start_time: eventStartTime, end_time: eventEndTime, location: eventLocation)
            self.promotionListController?.promotionList.promotions.append(model)
            self.promotionListController?.promotionList.promotionsStatus[model] = true
            self.promotionListController?.promotionListProtocol.loadTable()
        }
        return
    }
}
