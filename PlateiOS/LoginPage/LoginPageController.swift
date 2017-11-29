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
        if(username == "") loginPageProtocol.showErrorMessage(message: "Invalid password!")
        // check in the database if username exists
        // goto promotions table view controller
    }
    
    func tryToLogin(username: String) {
        if(username == "") loginPageProtocol.showErrorMessage(message: "Invalid password!")
        // check in the database if username exists
        // goto promotions table view controller
    }
}

