//
//  RootPresenter.swift
//  PlateiOS
//
//  Created by Renner Leite Lucena on 10/20/17.
//  Copyright © 2017 Renner Leite Lucena. All rights reserved.
//

import Foundation

final class RootPresenter {

    private unowned let view: RootView
    
    init(view: RootView) {
        self.view = view
    }
    
    func showDialogOnView() {
        view.showDialog(message: "Bora")
    }
    
    func changeNameFunctionStupidOnPresenter(){
        view.changeNameByProtocolOnView(name: "Nick")
    }
    
}
