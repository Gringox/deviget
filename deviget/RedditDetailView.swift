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
        if self.imageUrl != nil {
            self.presenter?.setImageForUIImageView()
        }
    }
    
    override func encodeRestorableState(with coder: NSCoder) {
        if let imageUrl = self.imageUrl {
            coder.encode(imageUrl, forKey: "imageUrl")
        }
        super.encodeRestorableState(with: coder)
    }
    
    override func decodeRestorableState(with coder: NSCoder) {
        self.imageUrl = coder.decodeObject(forKey: "imageUrl") as! String?
        super.decodeRestorableState(with: coder)
    }
    
    override func applicationFinishedRestoringState() {
        guard self.imageUrl != nil else { return }
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

    @IBAction func imageViewWasLongPressed(_ sender: UILongPressGestureRecognizer) {
        self.presenter?.imageViewWasLongPressed()
    }
    
}
