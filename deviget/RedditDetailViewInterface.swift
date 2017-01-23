//
//  RedditDetailViewInterface.swift
//  deviget
//
//  Created by Pedro Luis Valdivieso on 1/22/17.
//  Copyright © 2017 Pedro Luis Valdivieso. All rights reserved.
//

import UIKit

protocol RedditDetailViewInterface: UIStateRestoring {
    
    func viewController() -> UIViewController
    
    func getImageURL() -> String
    
    func getUIImageView() -> UIImageView
    
}
