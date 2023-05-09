//
//  LaunchScreenViewModel.swift
//  Opineon
//
//  Created by Rohit Kumar on 15/11/22.
//

import UIKit
import FirebaseAuth

class LaunchScreenViewModel {
    
    func isLoggedIn() -> Bool {
        if Auth.auth().currentUser != nil {
            return true
        }
        else {
            return false
        }
    }
}
