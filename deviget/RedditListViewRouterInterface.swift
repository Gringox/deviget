//
//  RedditListViewRouterInterface.swift
//  deviget
//
//  Created by Pedro Luis Valdivieso on 1/22/17.
//  Copyright © 2017 Pedro Luis Valdivieso. All rights reserved.
//

import UIKit

protocol RedditListViewRouterInterface {
    
    func prepareForSegue(segue: UIStoryboardSegue, post: RedditPost)
    
}
