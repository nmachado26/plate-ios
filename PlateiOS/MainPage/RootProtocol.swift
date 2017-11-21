//
//  RootView.swift
//  PlateiOS
//
//  Created by Renner Leite Lucena on 10/20/17.
//  Copyright © 2017 Renner Leite Lucena. All rights reserved.
//

import Foundation
import UIKit

// Protocol with the functions that the presenter can call, ordering the view to execute
protocol RootProtocol : class {
    func showAlert(title: String, message: String, arrayOfActions: [UIAlertAction])
    func loadTable()
}
