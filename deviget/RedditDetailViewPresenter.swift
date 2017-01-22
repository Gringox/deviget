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
    var router: RedditDetailViewRouterInterface?
    
    // MARK: - Utilities
    
    internal func setImageForUIImageView() {
        let imageView = view?.getUIImageView()
        let imageUrl = view?.getImageURL()
        imageView?.downloadedFrom(link: imageUrl!)
    }
    
    func image(_ image: UIImage,
               didFinishSavingWithError error: Error?,
               contextInfo: UnsafeRawPointer) {
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        
        if let error = error {
            alert.title = "Save error"
            alert.message = error.localizedDescription
            
        } else {
            alert.title = "Saved"
            alert.message = "Image has been saved to your photos."
        }
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.router?.presentVC(toVC: alert, fromVC: (self.view?.viewController())!)
    }
    
    // MARK: - Actions
    
    internal func imageViewWasLongPressed() {
        
        let alert = UIAlertController(title: nil,
                                      message: "Save image to camara roll?",
                                      preferredStyle: .actionSheet)
        
        let yesAction = UIAlertAction(title: "Yes", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            
            let imageView = (self.view?.getUIImageView())!
            
            UIImageWriteToSavedPhotosAlbum(
                imageView.image!,
                self,
                #selector(self.image(_:didFinishSavingWithError:contextInfo:)),
                nil
            )
            
        })
        
        let noAction = UIAlertAction(title: "No", style: .cancel, handler:nil)
        
        alert.addAction(yesAction)
        alert.addAction(noAction)
        
        self.router?.presentVC(toVC: alert, fromVC: (self.view?.viewController())!)
    }

}
