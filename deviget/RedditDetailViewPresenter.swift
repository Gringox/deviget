//
//  RedditDetailViewPresenter.swift
//  deviget
//
//  Created by Pedro Luis Valdivieso on 1/22/17.
//  Copyright © 2017 Pedro Luis Valdivieso. All rights reserved.
//

import UIKit

class RedditDetailViewPresenter: NSObject, RedditDetailViewPresenterInterface {
    
    var view: RedditDetailViewInterface?
    
    internal func setImageForUIImageView() {
        let imageView = view?.getUIImageView()
        let imageUrl = view?.getImageURL()
        imageView?.downloadedFrom(link: imageUrl!)
    }

}
