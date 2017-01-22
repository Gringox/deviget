//
//  RedditDetailViewRouter.swift
//  deviget
//
//  Created by Pedro Luis Valdivieso on 1/22/17.
//  Copyright © 2017 Pedro Luis Valdivieso. All rights reserved.
//

import UIKit

class RedditDetailViewRouter: NSObject, RedditDetailViewRouterInterface {
    
    internal func presentVC(toVC: UIViewController, fromVC: UIViewController) {
        fromVC.present(toVC, animated: true, completion: nil)
    }

}
