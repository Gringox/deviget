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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: RedditListViewCell = tableView
            .dequeueReusableCell(withIdentifier: String(describing: RedditListViewCell.self),
                                 for: indexPath) as! RedditListViewCell
        
        if indexPath.row % 2 == 0 {
            cell.titleLabel.text = "mjincdrtijnmoincdrtijmiudsfivjaiflnefivibhveibubiubiveuvebivebiybeivybilvbiuvibv;jfvkbjfvkbjlvkblfvbklvbkjdvbkjvkbjvkbjfvkbjlvbjkdvkbjfvjbkfbjkfkbjvjkbvkjbdvkbjdvkbjdvkbjldvkbjfvkbjavvkdvkbjadvbjkdvkbjdvkbjfvbkjfvkbjvbkfvbkljvbkjladfvbkadflbvkjladfbvkjdfablvkjdabflkvbkadfbvklblkadfbvlkadfjvadfjkbvkadfbvkbdfvjadfbvkadbfvjkadfbvadfjbvkjadfbvkjdafbvkjdfbjvdbvkbdjkvbdkbvadfjkbvkjadfbvkjadbvkjdabvkjdabvkldjabvkjladfbvkjadfbvkjadfbvkjadfbvjkadfbvkjdfbvjkbdakbvkjadbvjkdafbkvjbadfvkjdfbvkljadbvkljadbvkjladfbvjkbdkjvbkjadfbvkjadbkvjbadbvklabdjkvbadlkvbkadbvjkadfbvkljadfbvkladfbvkjldfvbkjdfbv"
        }else{
            cell.titleLabel.text = "Title"
        }
        
        return cell
    }
    
}
