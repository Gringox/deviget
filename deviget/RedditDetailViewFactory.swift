//
//  RedditDetailViewFactory.swift
//  deviget
//
//  Created by Pedro Luis Valdivieso on 1/22/17.
//  Copyright © 2017 Pedro Luis Valdivieso. All rights reserved.
//

import UIKit

class RedditDetailViewFactory: NSObject {
    
    class func initVIPERForRedditDetailView(view: RedditDetailView) {
        view.presenter = RedditDetailViewFactory.initPresenter(view: view)
    }
    
    private class func initPresenter(view: RedditDetailViewInterface) -> RedditDetailViewPresenterInterface {
        let presenter = RedditDetailViewPresenter()
        presenter.view = view
        return presenter as RedditDetailViewPresenterInterface
    }

}
