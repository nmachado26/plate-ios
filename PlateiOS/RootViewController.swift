//
//  RootViewController.swift
//  PlateiOS
//
//  Created by Renner Leite Lucena on 10/20/17.
//  Copyright © 2017 Renner Leite Lucena. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    fileprivate lazy var presenter: RootPresenter = {
        return RootPresenter(view: self)
    }()
    
    @IBAction func button_for_testing(_ sender: Any) {
        showDialog(message: "Let's go!")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension RootViewController : RootView {
    func showDialog(message: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

