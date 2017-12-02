//
//  LoginPageController.swift
//  PlateiOS
//
//  Created by Renner Leite Lucena on 11/28/17.
//  Copyright © 2017 Renner Leite Lucena. All rights reserved.
//

import UIKit

final class LoginPageController {
    
    private unowned let loginPageProtocol: LoginPageProtocol
    
    init(loginPageProtocol: LoginPageProtocol) {
        self.loginPageProtocol = loginPageProtocol
    }
}

extension LoginPageController {
    
    func tryToSignup(username: String) {
        if(username == "") {
            loginPageProtocol.showErrorMessage(title: "error", message: "Invalid password!")
            return
        }
        // check in the database if username exists
        let responseFromDatabase = true // get from the database, passing the username to alamofire method
        
        // goto promotions table view controller
        //           open for me a new MVC - the one...
        if(responseFromDatabase == true) {
            let promotionListViewController = UIStoryboard.init(name: "PromotionList", bundle: nil).instantiateViewController(withIdentifier: "PromotionList")
                as! PromotionListViewController
            promotionListViewController.username = username
            loginPageProtocol.openViewController(controller: promotionListViewController)
        }
        else {
            loginPageProtocol.showErrorMessage(title: "error", message: "invalid username")
        }
    }
    
    func tryToLogin(username: String) {
        if(username == "") {
            loginPageProtocol.showErrorMessage(title: "error", message: "Invalid password!")
            return
        }
        let responseFromDatabase = true
        
        if(responseFromDatabase == true) {
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
