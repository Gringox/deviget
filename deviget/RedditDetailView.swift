//
//  RedditDetailView.swift
//  deviget
//
//  Created by Pedro Luis Valdivieso on 1/22/17.
//  Copyright © 2017 Pedro Luis Valdivieso. All rights reserved.
//

import UIKit

class RedditDetailView: UIViewController, RedditDetailViewInterface {
    
    var imageUrl: String?
    
    var presenter: RedditDetailViewPresenterInterface?

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RedditDetailViewFactory.initVIPERForRedditDetailView(view: self)
        self.presenter?.setImageForUIImageView()
    }
    
    // MARK: - Getters & Setters
    
    internal func viewController() -> UIViewController {
        return self
    }
    
    internal func getImageURL() -> String {
        return self.imageUrl!
    }
    
    internal func getUIImageView() -> UIImageView {
        return self.imageView
    }

}
