//
//  LoginPageViewController.swift
//  PlateiOS
//
//  Created by Renner Leite Lucena on 11/28/17.
//  Copyright © 2017 Renner Leite Lucena. All rights reserved.
//

import UIKit

class LoginPageViewController: UIViewController {
    
    @IBOutlet weak var constraintOffset: NSLayoutConstraint!
    
    @IBOutlet weak var username_input: UITextField! {
        didSet {
            let imageView = UIImageView(frame: CGRect(x: 10, y: 0, width: 20, height: 20))
            imageView.image = #imageLiteral(resourceName: "usernameIcon")
            let contentView = UIView(frame: CGRect(x: 10, y: 0, width: 30, height: 20))
            contentView.addSubview(imageView)
            
            username_input.delegate = self
            username_input.leftViewMode = UITextFieldViewMode.always
            username_input.leftView = contentView
            username_input.placeholder = "Username"
        }
    }
    
    @IBOutlet weak var signup_button: UIButton! {
        didSet {
            signup_button.layer.cornerRadius = 15
            signup_button.layer.borderWidth = 2
            signup_button.layer.borderColor = UIColor.white.cgColor
        }
    }
    
    @IBOutlet weak var login_button: UIButton! {
        didSet {
            login_button.backgroundColor = UIColor.white
            login_button.layer.cornerRadius = 15
            login_button.layer.borderWidth = 2
            login_button.layer.borderColor = UIColor.white.cgColor
        }
    }
    
    @IBAction func signup_button_action(_ sender: Any) {
        loginPageController.tryToSignup(username: username_input.text ?? "")
    }
    
    @IBAction func login_button_action(_ sender: Any) {
        loginPageController.tryToLogin(username: username_input.text ?? "")
    }
    
    fileprivate lazy var loginPageController: LoginPageController = {
        return LoginPageController(loginPageProtocol: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
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

extension LoginPageViewController: LoginPageProtocol {
    
    func showErrorMessage(title : String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        present(alert, animated: true, completion: nil)
    }
    
    func openViewController(controller: UIViewController) {
        DispatchQueue.main.async {
            self.show(controller, sender: nil)
        }
    }
    
    func presentViewController(controller: UIViewController) {
        DispatchQueue.main.async {
            self.present(controller, animated: true, completion: nil)
        }
    }
}

extension LoginPageViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        for textField in self.view.subviews where textField is UITextField {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if(username_input == textField) {
            constraintOffset.constant = 25
            self.view.layoutIfNeeded()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        constraintOffset.constant = 150
        self.view.layoutIfNeeded()
    }
}


