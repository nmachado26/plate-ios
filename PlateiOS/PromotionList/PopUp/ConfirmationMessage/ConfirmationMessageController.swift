//
//  ConfirmationMessageViewController.swift
//  PlateiOS
//
//  Created by Nick Machado on 12/25/17.
//  Copyright © 2017 Renner Leite Lucena. All rights reserved.
//

import UIKit
import Foundation

class ConfirmationMessageController: UIViewController {
    
    var eventName: String? = ""
    @IBOutlet weak var confirmationMessageOnView: UIView!
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

extension ConfirmationMessageController {
    
    fileprivate func setupUI() {
        let confirmationView = ConfirmationPopUp.makeXib()
        showConfirmationPopUp(confirmationView: confirmationView)
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

extension ConfirmationMessageController {
    
    fileprivate func dismissAnimated() {
        self.view.subviews.forEach { $0.removeFromSuperview() }
        
        DispatchQueue.main.async {
            self.dismiss(animated: true)
        }
    }
    
    fileprivate func showConfirmationPopUp(confirmationView: ConfirmationPopUp) {
        confirmationMessageOnView.addSubview(confirmationView)
        
        DispatchQueue.main.async {
            self.addConstraintsModelContainer(with: confirmationView)
            UIView.animate(withDuration: 0.5) { [weak self] in self?.confirmationMessageOnView.alpha = 1 }
        }
    }
    
        fileprivate func addConstraintsModelContainer(with subview: UIView) {
            subview.translatesAutoresizingMaskIntoConstraints = false
            subview.topAnchor.constraint(equalTo: confirmationMessageOnView.topAnchor).isActive = true
            subview.bottomAnchor.constraint(equalTo: confirmationMessageOnView.bottomAnchor).isActive = true
            subview.trailingAnchor.constraint(equalTo: confirmationMessageOnView.trailingAnchor).isActive = true
            subview.leadingAnchor.constraint(equalTo: confirmationMessageOnView.leadingAnchor).isActive = true
        }
}

extension ConfirmationMessageController {
    
    //init the message controller
    //HAS NOT BEEN CALLED
    fileprivate func setUpMessage(for messageView: ConfirmationPopUp) {
        messageView.closeFunction = { [weak self] in
            self?.closePopup()
        }
        messageView.eventLabel.text = eventName
    }
}




