//
//  RedditListViewRouter.swift
//  deviget
//
//  Created by Pedro Luis Valdivieso on 1/22/17.
//  Copyright © 2017 Pedro Luis Valdivieso. All rights reserved.
//

import UIKit

class RedditListViewRouter: NSObject, RedditListViewRouterInterface {
    
    internal func prepareForSegue(segue: UIStoryboardSegue, post: RedditPost) {
        let toVC = segue.destination as! RedditDetailView
        toVC.imageUrl = post.image
    }

}
