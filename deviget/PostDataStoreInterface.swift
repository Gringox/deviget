//
//  PostDataStoreInterface.swift
//  deviget
//
//  Created by Pedro Luis Valdivieso on 1/21/17.
//  Copyright © 2017 Pedro Luis Valdivieso. All rights reserved.
//

import Foundation

protocol PostDataStoreInterface {
    
    func getNumberOfPosts() -> Int
    
    func getPostAtIndex(index: Int) -> RedditPost
    
    func loadPosts(successCallback: @escaping () -> (),
                   failureCallback: @escaping () -> ())
    
}
