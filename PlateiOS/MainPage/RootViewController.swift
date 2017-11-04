//
//  RootViewController.swift
//  PlateiOS
//
//  Created by Renner Leite Lucena on 10/20/17.
//  Copyright © 2017 Renner Leite Lucena. All rights reserved.
//

import UIKit
import Alamofire

class RootViewController: UIViewController,  UITableViewDelegate  {
//UITableViewDataSource
    
//    @IBOutlet weak var bob: UILabel!
//
//    fileprivate lazy var presenter: RootPresenter = {
//        return RootPresenter(view: self)
//    }()
//    //asfcdzf
//    @IBAction func button_for_testing(_ sender: Any) {
//        presenter.showDialogOnView()
//        presenter.changeNameFunctionStupidOnPresenter()
//    }

    /* TABLE VIEW METHODS
     */
    
    @IBOutlet weak var tableView: UITableView!
    
    var actorsArray =  [AnyObject]()
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("https://plate-database.herokuapp.com/users").responseJSON { response in
            print("\(response)")
            
//            let result = response.result
//            if let dict = result.value as? Dictionary<String.AnyObject>{
//                if let innerDict = dict["username:"]{
//                }
//        }
    }
    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//    }
    
    
    
    
    
    
    
    
    
//    let list = ["Google PHD Event", "Microsoft Speaker", "Brazilian Barbecue", "Alumni MeetUp", "Foodie Event", "Fraternity Barbecue"]
//
    //Tableview, returns the number of items on the list of events
//    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
//        return(list.count)
    //}
    
    //Tableview, prints the cells of the items in the array on the canvas
//    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
//        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
//        cell.textLabel?.text = list[indexPath.row]
//        return(cell)
//    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//extension RootViewController : RootView {
//    func changeNameByProtocolOnView(name: String) {
//        bob.text = name
//    }
//
//    func showDialog(message: String) {
//        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//        present(alert, animated: true, completion: nil)
//    }
//
//}

