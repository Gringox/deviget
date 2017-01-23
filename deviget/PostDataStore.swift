//
//  PostDataStore.swift
//  deviget
//
//  Created by Pedro Luis Valdivieso on 1/21/17.
//  Copyright © 2017 Pedro Luis Valdivieso. All rights reserved.
//

import UIKit

class PostDataStore: NSObject, PostDataStoreInterface {
    
    var posts: [RedditPost] = [RedditPost]()
    var lastPostIdentifier: String?
    
    internal func getNumberOfPosts() -> Int {
        return posts.count
    }
    
    internal func getPostAtIndex(index: Int) -> RedditPost {
        return posts[index]
    }
    
    internal func loadPosts(successCallback: @escaping () -> (),
                   failureCallback: @escaping () -> ()) {
        PostRepository.getAllPost(after: self.lastPostIdentifier,
        successCallback: { (posts: [RedditPost], lastPostIdentifier: String) in
            self.posts += posts
            self.lastPostIdentifier = lastPostIdentifier
            successCallback()
        }) {
            failureCallback()
        }
    }

}
