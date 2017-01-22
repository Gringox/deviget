//
//  RedditListViewCell.swift
//  deviget
//
//  Created by Pedro Luis Valdivieso on 1/21/17.
//  Copyright © 2017 Pedro Luis Valdivieso. All rights reserved.
//

import UIKit

class RedditListViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var numberOfCommentsLabel: UILabel!
    @IBOutlet weak var authorAndDateLabel: UILabel!
    
    func initCellWithPost(post: RedditPost) {
        self.authorAndDateLabel.text = "by " + post.author!
        self.titleLabel.text = post.title
        self.numberOfCommentsLabel.text = "\(post.numberOfComments!)"
        
        if let thumbnail = post.thumbnail {
            self.thumbnailImageView.downloadedFrom(link: thumbnail)
        }else{
            self.thumbnailImageView.image = UIImage(named: "reddit_logo.png")
        }
    }
    
}
