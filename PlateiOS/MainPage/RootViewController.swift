//
//  RootViewController.swift
//  PlateiOS
//
//  Created by Renner Leite Lucena on 10/20/17.
//  Copyright © 2017 Renner Leite Lucena. All rights reserved.
//

import UIKit
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

class RootViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var yourArray = [String]()
    
   // Separate file
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventsCell", for: indexPath) as! EventsCell
        
        cell.commonInit()
        return cell
    }
    
    
    
    
    @IBOutlet weak var EventsTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        EventsTable.dataSource = self
        EventsTable.delegate = self
        
        let nibName = UINib(nibName: "EventsCell", bundle: nil)
        EventsTable.register(nibName, forCellReuseIdentifier: "EventsCell")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

