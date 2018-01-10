//
//  AddPromotionDialogViewController.swift
//  PlateiOS
//
//  Created by Renner Leite Lucena on 1/8/18.
//  Copyright © 2018 Renner Leite Lucena. All rights reserved.
//

import UIKit
import Foundation

class AddPromotionDialogViewController: UIViewController {
    
    var positiveFunction: ((PromotionModel) -> Void)?
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var addPromotionDialog: UIView!
    @IBOutlet weak var constraintOffset: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTapCloseAction()
        setupUI()
    }
}

extension AddPromotionDialogViewController {
    
    fileprivate func setupUI() {
        let inputPopUpView = InputPopUp.makeXib()
        showInputPopUp(inputPopUpView: inputPopUpView)
    }
    
    fileprivate func setupTapCloseAction() {
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

extension AddPromotionDialogViewController {
    
    fileprivate func dismissAnimated() {
        self.view.subviews.forEach { $0.removeFromSuperview() }
        
        DispatchQueue.main.async {
            self.dismiss(animated: true)
        }
    }
    
    fileprivate func showInputPopUp(inputPopUpView: InputPopUp) {
        inputPopUpView.negativeFunction = { [weak self] in
            self?.closePopup()
        }
        
        inputPopUpView.positiveFunction = { [weak self] promotionModel in
            self?.positiveFunction?(promotionModel)
            self?.closePopup()
        }
        
        addPromotionDialog.addSubview(inputPopUpView)
        
        DispatchQueue.main.async {
            self.addConstraintsModelContainer(with: inputPopUpView)
            UIView.animate(withDuration: 0.5) { [weak self] in self?.addPromotionDialog.alpha = 1 }
        }
    }
    
    fileprivate func addConstraintsModelContainer(with subview: UIView) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.topAnchor.constraint(equalTo: addPromotionDialog.topAnchor).isActive = true
        subview.bottomAnchor.constraint(equalTo: addPromotionDialog.bottomAnchor).isActive = true
        subview.trailingAnchor.constraint(equalTo: addPromotionDialog.trailingAnchor).isActive = true
        subview.leadingAnchor.constraint(equalTo: addPromotionDialog.leadingAnchor).isActive = true
    }
}

extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension AddPromotionDialogViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        for textField in self.view.subviews where textField is UITextField {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        constraintOffset.constant = -100
        self.view.layoutIfNeeded()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        constraintOffset.constant = 0
        self.view.layoutIfNeeded()
    }
}

