//
//  PostFactory.swift
//  deviget
//
//  Created by Pedro Luis Valdivieso on 1/21/17.
//  Copyright © 2017 Pedro Luis Valdivieso. All rights reserved.
//

import UIKit

class PostFactory: NSObject {
    
    class func initPostModule() -> PostDataStoreInterface {
        return PostDataStore() as PostDataStoreInterface
    }

}
