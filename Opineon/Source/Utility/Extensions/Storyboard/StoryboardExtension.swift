//
//  StoryboardExtension.swift
//  Opineon
//
//  Created by Rohit Kumar on 15/11/22.
//

import UIKit

enum StoryboardName: String {
    case main       = "Main"
    case auth       = "Auth"
    case home       = "Home"
    case settings   = "Settings"
}

enum ViewControllerIdentifier: String {
    case authViewContoller          =   "PhoneAuthViewController"
    case oneTimeCodeController      =   "OneTimeCodeViewController"
    case homeViewController         =   "HomeViewController"
}


extension UIStoryboard {
    
    
    /// Instantiate a new view controller with the identifier in the given storboard
    ///
    ///
    /// - Parameters:
    ///     - storyboard: Select a storyboard from enum
    ///     - identfier: Select a viewcontroller from enum
    ///
    /// - RETURNS:
    ///        - return: Returns a new viewcontroller
    static func viewController(`in` storyboard: StoryboardName, withIdentifier identifier: ViewControllerIdentifier) -> UIViewController {
        let authStoryboard = UIStoryboard.init(name: storyboard.rawValue, bundle: nil)
        return authStoryboard.instantiateViewController(withIdentifier: identifier.rawValue)
    }
}
