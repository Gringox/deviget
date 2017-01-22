//
//  RedditListViewPresenterInterface.swift
//  deviget
//
//  Created by Pedro Luis Valdivieso on 1/21/17.
//  Copyright © 2017 Pedro Luis Valdivieso. All rights reserved.
//

import UIKit

protocol RedditListViewPresenterInterface: UITableViewDataSource, UITableViewDelegate {
    
    func loadPost()
    
    func shouldPerformPostDetailSegue(sender: Any) -> Bool
    
    func prepareForSegue(segue: UIStoryboardSegue, sender: Any)
    
}
