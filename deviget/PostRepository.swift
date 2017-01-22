//
//  PostRepository.swift
//  deviget
//
//  Created by Pedro Luis Valdivieso on 1/21/17.
//  Copyright © 2017 Pedro Luis Valdivieso. All rights reserved.
//

import UIKit

class PostRepository: NSObject {
    
    class func getAllPost(after: String?,
                          successCallback: @escaping ([RedditPost], String) -> (),
                          failureCallback: @escaping () -> ()) {
        
        let apiClient: HTTPClient = HTTPClient.sharedHTTPClient
        
        var params: [String : Any] = [
            "limit": AppDefaults.LIMIT
        ]
        
        if let after = after {
            params["after"] = after
        }

        apiClient.doGET(
        url: "https://www.reddit.com/top.json",
        params: params,
        onSuccess: { (response: [String : Any]) in
            
            guard let data = response["data"] as! [String:Any]? else {
                return failureCallback()
            }
            
            guard let rawPosts = data["children"] as! [[String:Any]]? else {
                return failureCallback()
            }
            
            guard let posts = RedditPost
                .initRedditPostsFromRawPostsArray(rawPosts: rawPosts) else {
                    return failureCallback()
            }
            
            guard let after = data["after"] as! String? else {
                return failureCallback()
            }
            
            successCallback(posts, after)
        }) { 
            failureCallback()
        }

    }

}
