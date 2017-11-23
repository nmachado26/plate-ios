//
//  RootViewController.swift
//  PlateiOS
//
//  Created by Renner Leite Lucena on 10/20/17.
//  Copyright © 2017 Renner Leite Lucena. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    // Basically lazily initializes the presenter - only instantiates it,
    // "wasting" memory to do it, when the presenter is used for the first time.
    // Search more to understand better.
    fileprivate lazy var rootPresenter: RootPresenter = {
        
        // see that we give self as parameter as the rootProtocol because this
        // viewController implements this, and so the presenter can use it.
        return RootPresenter(rootProtocol: self)
    }()
    
    // Custom data source and delegate for our tableView. These two contain the important
    // methods that we have to override to change the default behaviour of the tableView.
    // We create separate files to declare them.
    fileprivate let dataSource = PromotionListDataSource()
    fileprivate let delegate = PromotionListDelegate()
    
    // TableView outlet
    @IBOutlet fileprivate weak var promotionTable: UITableView!
    
    // Uses this part of the lifecycle of the view to initialize the promotionsList, one
    // located in the presenter, initialized there as well, later used to load the
    // tableView.
    override func viewDidLoad() {
        super.viewDidLoad()
        rootPresenter.initializePromotionList()
    }
}

// Extension for organization - all the functions, just as the view, are passive and just
// obey the presenter.
extension RootViewController: RootProtocol {
    
    // Method that we will use later to present an alert with two actions, cancel or
    // confirm that you clicked in the "No food left" button.
    func showAlert(title : String, message: String, arrayOfActions: [UIAlertAction]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        arrayOfActions.forEach { alert.addAction($0) }
        present(alert, animated: true, completion: nil)
    }
    
    // Method that runs after the promotionsList in the presenter is filled with
    // information from the database.
    func loadTable() {
        
        // self.dataSource and self.delegate reference to our global variables
        // instantiated before. The self.dataSource.rootPresenter is basically a
        // reference in the dataSource to our rootPresenter, one that we need to access
        // the promotionsList from there (see the file PromotionListDataSource).
        self.dataSource.rootPresenter = self.rootPresenter
        promotionTable.dataSource = self.dataSource
        promotionTable.delegate = self.delegate

        // Block of code that registers our xib, followed by reload data, to finally put
        // the data saved in the promotionsList in the tableView. 
        let nibName = UINib(nibName: "PromotionCell", bundle: nil)
        promotionTable.register(nibName, forCellReuseIdentifier: "PromotionCell")
        promotionTable.reloadData()
    }
}

