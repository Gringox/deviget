//
//  RedditPost.swift
//  deviget
//
//  Created by Pedro Luis Valdivieso on 1/21/17.
//  Copyright © 2017 Pedro Luis Valdivieso. All rights reserved.
//

import UIKit

class RedditPost: NSObject {
    
    var title: String?
    var author: String?
    var date: Date?
    var thumbnail: String?
    var numberOfComments: Int?
    var image: String?
    
    class func initRedditImageFromDictionary(dictionary:[String:Any]) -> String? {
        guard let preview = dictionary["preview"] as! [String:Any]? else { return nil }
        guard let images = preview["images"] as! [[String:Any]]? else { return nil }
        guard let firstItem = images[0] as [String:Any]? else { return nil }
        guard let source = firstItem["source"] as! [String:Any]? else { return nil }
        guard let imageUrl = source["url"] as! String? else { return nil }
        return imageUrl
    }
    
    class func initRedditPostFromDictionary(dictionary:[String:Any]?) -> RedditPost? {
        
        guard let dictionary = dictionary else { return nil }
        guard let title = dictionary["title"] as! String? else { return nil }
        guard let author = dictionary["author"] as! String? else { return nil }
        guard let date = dictionary["created_utc"] as! Double? else { return nil }
        guard let numberOfComments = dictionary["num_comments"] as! Int? else { return nil }
        
        let post: RedditPost = RedditPost()
        post.title = title
        post.author = author
        post.date = Date(timeIntervalSince1970: date)
        post.numberOfComments = numberOfComments
        
        if let thumbnail = dictionary["thumbnail"] as! String? {
            post.thumbnail = thumbnail
        }
        
        if let image = RedditPost.initRedditImageFromDictionary(dictionary: dictionary) {
            post.image = image
        }
        
        return post
    }
    
    class func initRedditPostsFromRawPostsArray(rawPosts: [[String:Any]]) -> [RedditPost]? {
    
        var posts: [RedditPost] = [RedditPost]()
        
        for rawPost in rawPosts {
            guard let data = rawPost["data"] as! [String:Any]? else { return nil }
            guard let post: RedditPost = RedditPost
                .initRedditPostFromDictionary(dictionary: data) else { return nil }
            posts.append(post)
        }
        
        return posts
    }
    
}
