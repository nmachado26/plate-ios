//
//  RootViewController.swift
//  PlateiOS
//
//  Created by Renner Leite Lucena on 10/20/17.
//  Copyright © 2017 Renner Leite Lucena. All rights reserved.
//

import UIKit

//REMOVE ALL COMMENTS THAT WE WILL NOT USE ANYMORE

//import Alamofire

//public struct Promotion: Decodable {
//    let promotion_id : String
//    let title : String
//    let start_time : String
//    let end_time : String
//    let location : String
//}

//class RootViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource  {
////UITableViewDataSource
//    let photo1 = UIImage(named: "go sign")
//@IBOutlet weak var tableView: UITableView!
//
//    var promotions = [Promotion]()
//    var yourArray = [String]()
//    let list = ["Google PHD Event", "Microsoft Speaker", "Brazilian Barbecue", "Alumni MeetUp", "Foodie Event", "Fraternity Barbecue"]
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let jsonURL = "https://plate-heroku-database.herokuapp.com/promotions"
//        let url = URL(string: jsonURL)
//
//        URLSession.shared.dataTask(with: url!) { (data, response, error) in
//
//            do{
//                self.promotions = try JSONDecoder().decode([Promotion].self, from: data!)
//
//                for eachPromotion in self.promotions {
//                    print(eachPromotion.promotion_id + " : " + eachPromotion.title + " : " + eachPromotion.start_time + " : " + eachPromotion.end_time + " : " + eachPromotion.location)
//                    print( " " )
//                    self.yourArray.append(eachPromotion.title)
//                    print("Printed array: ")
//                    print(self.yourArray)
//                }
//
//            }
//            catch{
//                print("Error")
//            }
////            DispatchQueue.main.async {
////                self.tableView.reloadData()
////            }
//            }
//    .resume()
//
//        let nibName = UINib(nibName: "CustomTableViewCell", bundle: nil)
//        tableView.register(nibName, forCellResuseIdentifier: "CustomTableViewCell")
//
//
//    }
//
//    /* TABLE VIEW METHODS
//     */
//
//
//    //Tableview, returns the number of items on the list of events
//    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print(yourArray.count)
//        return(yourArray.count)
//    }
//
//   // Tableview, prints the cells of the items in the array on the canvas
//    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//
//       let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
//
//        cell.textLabel?.text = yourArray[indexPath.row]
//
//        return(cell)
//
////        guard let item = presenter?.cartListModel?.items[indexPath.row] else { return UITableViewCell() }
////
////        let cartItemCell: CartItemCell = tableView.dequeueReusableCell(for: indexPath)
////
////        cartItemCell.cellModel = item
////
////        return cardModel
//    }
//
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//}

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

