//
//  RedditListViewPresenter.swift
//  deviget
//
//  Created by Pedro Luis Valdivieso on 1/21/17.
//  Copyright © 2017 Pedro Luis Valdivieso. All rights reserved.
//

import UIKit

class RedditListViewPresenter: NSObject, RedditListViewPresenterInterface {
    
    var view: RedditListViewInterface?
    var dataStore: PostDataStoreInterface?
    
    // MARK: - Services
    
    internal func loadPost() {
    
        let success = {() -> () in
            DispatchQueue.main.async {
                self.view?.getUITableView().reloadData()
            }
        }
        
        let failure = {() -> () in
            // Show some alert
        }
        
        self.dataStore?.loadPosts(successCallback: success, failureCallback: failure)
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.dataStore?.getNumberOfPosts())!
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: RedditListViewCell = tableView
            .dequeueReusableCell(withIdentifier: String(describing: RedditListViewCell.self),
                                 for: indexPath) as! RedditListViewCell
        
        let post: RedditPost = (self.dataStore?.getPostAtIndex(index: indexPath.row))!
        cell.initCellWithPost(post: post)
        
        return cell
    }
    
}
