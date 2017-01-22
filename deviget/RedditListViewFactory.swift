//
//  RedditListViewFactory.swift
//  deviget
//
//  Created by Pedro Luis Valdivieso on 1/21/17.
//  Copyright © 2017 Pedro Luis Valdivieso. All rights reserved.
//

import UIKit

class RedditListViewFactory: NSObject {
    
    class func initVIPERFor(view: RedditListView) {
        view.presenter = RedditListViewFactory.initPresenterWith(view: view)
    }
    
    private class func initPresenterWith(view: RedditListViewInterface) -> RedditListViewPresenterInterface {
        let presenter: RedditListViewPresenter = RedditListViewPresenter()
        presenter.view = view
        return presenter as RedditListViewPresenterInterface
    }

}
