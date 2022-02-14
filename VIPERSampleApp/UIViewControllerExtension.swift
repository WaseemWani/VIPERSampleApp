//
//  ViewControllerExtension.swift
//  VIPERSampleApp
//
//  Created by Waseem Wani on 22/01/22.
//

import UIKit

extension UIViewController {
    
    static func instantiate<T>() -> T {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "\(T.self)") as! T
            return viewController
    }
}


