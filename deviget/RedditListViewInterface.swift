//
//  RedditListViewInterface.swift
//  deviget
//
//  Created by Pedro Luis Valdivieso on 1/21/17.
//  Copyright © 2017 Pedro Luis Valdivieso. All rights reserved.
//

import UIKit

protocol RedditListViewInterface {
    
    func viewController() -> UIViewController
    
    func getUITableView() -> UITableView
    
}
