//
//  RedditListView.swift
//  deviget
//
//  Created by Pedro Luis Valdivieso on 1/21/17.
//  Copyright © 2017 Pedro Luis Valdivieso. All rights reserved.
//

import UIKit

class RedditListView: UIViewController, RedditListViewInterface {
    
    @IBOutlet weak private var tableView: UITableView!
    
    // MARK: - VIPER
    var presenter: RedditListViewPresenterInterface?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        RedditListViewFactory.initVIPERFor(view: self)
        
        self.tableView.dataSource = self.presenter
        self.tableView.delegate = self.presenter
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 120
        
        self.presenter?.loadPost()
    }
    
    // MARK: View Getters & Setters
    
    internal func viewController() -> UIViewController {
        return self
    }
    
    internal func getUITableView() -> UITableView {
        return self.tableView
    }

}
