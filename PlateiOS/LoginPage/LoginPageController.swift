//
//  LoginPageController.swift
//  PlateiOS
//
//  Created by Renner Leite Lucena on 11/28/17.
//  Copyright © 2017 Renner Leite Lucena. All rights reserved.
//

import UIKit

final class LoginPageController {
    
    private let loginPageService: LoginPageService
    private unowned let loginPageProtocol: LoginPageProtocol
    
    init(loginPageProtocol: LoginPageProtocol) {
        self.loginPageProtocol = loginPageProtocol
        self.loginPageService = LoginPageService()
    }
}

extension LoginPageController {
    
    func tryToSignup(username: String) {
        if(username == "") { //add validations
            loginPageProtocol.showErrorMessage(title: "error", message: "Invalid password!")
            return
        }
        
        loginPageService.registerUser(username: username, completion: { [weak self] success, username in
            self?.handleRegisterUser(success: success, username: username)
        })
    }
    
    func tryToLogin(username: String) {
        if(username == "") { //add validations
            loginPageProtocol.showErrorMessage(title: "error", message: "Invalid password!")
            return
        }
        
        loginPageService.checkUser(username: username, completion: { [weak self] success, username in
            self?.handleCheckUser(success: success, username: username)
        })
    }
}

extension LoginPageController {
    fileprivate func handleRegisterUser(success: Bool, username: String) {
        if(success == true) {
            let promotionListViewController = UIStoryboard.init(name: "PromotionList", bundle: nil).instantiateViewController(withIdentifier: "PromotionList")
                as! PromotionListViewController
            promotionListViewController.username = username
            loginPageProtocol.openViewController(controller: promotionListViewController)
        }
        else {
            loginPageProtocol.showErrorMessage(title: "error", message: "invalid username")
        }
    }
    
    fileprivate func handleCheckUser(success: Bool, username: String) {
        if(success == true) {
            let promotionListViewController = UIStoryboard.init(name: "PromotionList", bundle: nil).instantiateViewController(withIdentifier: "PromotionList")
                as! PromotionListViewController
            promotionListViewController.username = username
            loginPageProtocol.openViewController(controller: promotionListViewController)
        }
        else {
            loginPageProtocol.showErrorMessage(title: "error", message: "invalid username")
        }
    }
}
