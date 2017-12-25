//
//  PromotionListViewController.swift
//  PlateiOS
//
//  Created by Renner Leite Lucena on 10/20/17.
//  Copyright © 2017 Renner Leite Lucena. All rights reserved.
//

import UIKit

class PromotionListViewController: UIViewController {
    
    // Custom data source and delegate for our tableView. These two contain the important
    // methods that we have to override to change the default behaviour of the tableView.
    // We create separate files to declare them.
    fileprivate var dataSource = PromotionListDataSource()
    fileprivate var delegate = PromotionListDelegate()
    
    // Username, set in with information about the user logged
    var username = ""
    
    // Basically lazily initializes the controller - only instantiates it,
    // "wasting" memory to do it, when the controller is used for the first time.
    // Search more to understand better.
    fileprivate lazy var promotionListController: PromotionListController = {
        
        // see that we give self as parameter as the promotionListProtocol because this
        // viewController implements this, and so the controller can use it.
        return PromotionListController(promotionListProtocol: self)
    }()
    
    // Loading outlet
    @IBOutlet weak var loading: UIActivityIndicatorView! {
        didSet {
            loading.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
            loading.color = UIColor(red: 0.79, green: 0.23, blue: 0.20, alpha: 1.0)
        }
    }
    
    // TableView outlet
    @IBOutlet fileprivate weak var promotionTable: UITableView!
    
    // Uses this part of the lifecycle of the view to initialize the promotionsList, one
    // located in the controller, initialized there as well, later used to load the
    // tableView.
    override func viewDidLoad() {
        super.viewDidLoad()
        promotionTable.tableFooterView = UIView()
        promotionListController.initializePromotionList(username: username)
    }
}

// Extension for organization - all the functions, just as the view, are passive and just
// obey the controller.
extension PromotionListViewController: PromotionListProtocol {
    
    // Method to reload the table
    func reloadTable() {
        promotionTable.reloadData()
    }
    
    func showLoading() {
        loading.startAnimating()
        loading.alpha = 1
    }
    
    func hideLoading() {
        loading.stopAnimating()
        loading.alpha = 0
    }
    
    // Method that we will use later to present an alert with two actions, cancel or
    // confirm that you clicked in the "No food left" button.
    func showAlert(title : String, message: String, arrayOfActions: [UIAlertAction]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        arrayOfActions.forEach { alert.addAction($0) }
        present(alert, animated: true, completion: nil)
    }
    
    // Method that runs after the promotionsList in the controller is filled with
    // information from the database.
    func loadTable() {
        // self.dataSource and self.delegate reference to our global variables
        // instantiated before. The self.dataSource.promotionListController is basically a
        // reference in the dataSource to our promotionListController, one that we need to
        // access the promotionsList from there (see the file PromotionListDataSource).
        self.dataSource.promotionListController = self.promotionListController
        promotionTable.dataSource = self.dataSource
        promotionTable.delegate = self.delegate
        
        // Block of code that registers our xib, followed by reload data, to finally put
        // the data saved in the promotionsList in the tableView. 
        let nibName = UINib(nibName: "PromotionCell", bundle: nil)
        promotionTable.register(nibName, forCellReuseIdentifier: "PromotionCell")
        promotionTable.reloadData()
    }
}

