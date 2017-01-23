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
    var router: RedditListViewRouterInterface?
    
    // MARK: - Services
    
    internal func loadPosts() {
    
        let success = {() -> () in
            DispatchQueue.main.async {
                self.view?.getUITableView().reloadData()
            }
        }
        
        let failure = {() -> () in
            let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
            alert.title = "Oops"
            alert.message = "There was an error loading Reddit posts"
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.router?.presentVC(toVC: alert, fromVC: (self.view?.viewController())!)
        }
        
        self.dataStore?.loadPosts(successCallback: success, failureCallback: failure)
    }
    
    private func paginate(itemNumber: Int) {
        let currentNumberOfPost = (self.dataStore?.getNumberOfPosts())!
        if itemNumber == currentNumberOfPost - 1 {
            if AppDefaults.MAX_NUMBER_OF_POSTS > currentNumberOfPost { // 50 posts tops
                self.loadPosts()
            }
        }
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
        
        self.paginate(itemNumber: indexPath.row)
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Routing
    
    internal func shouldPerformPostDetailSegue(sender: Any) -> Bool {
        let tableView = self.view?.getUITableView()
        let indexPath = tableView?.indexPath(for: sender as! UITableViewCell)
        let post: RedditPost = (self.dataStore?.getPostAtIndex(index: indexPath!.row))!
        return post.image != nil ? true : false
    }
    
    internal func prepareForSegue(segue: UIStoryboardSegue, sender: Any) {
        let tableView = self.view?.getUITableView()
        let indexPath = tableView?.indexPath(for: sender as! UITableViewCell)
        let post: RedditPost = (self.dataStore?.getPostAtIndex(index: indexPath!.row))!
        self.router?.prepareForSegue(segue: segue, post: post)
    }
    
}
