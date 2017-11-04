//
//  RootViewController.swift
//  PlateiOS
//
//  Created by Renner Leite Lucena on 10/20/17.
//  Copyright © 2017 Renner Leite Lucena. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    @IBOutlet weak var bob: UILabel!
    
    fileprivate lazy var presenter: RootPresenter = {
        return RootPresenter(view: self)
    }()
    //asfcdzf
    @IBAction func button_for_testing(_ sender: Any) {
        presenter.showDialogOnView()
        presenter.changeNameFunctionStupidOnPresenter()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        presenter.changeNameFunctionStupidOnPresenter()
    }
}

extension RootViewController : RootView {
    func changeNameByProtocolOnView(name: String) {
        bob.text = name
    }
    
    func showDialog(message: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}

