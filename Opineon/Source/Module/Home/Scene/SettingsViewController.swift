//
//  SettingsViewController.swift
//  Opineon
//

//

import UIKit
import FirebaseAuth
import Firebase

class SettingsViewController: UIViewController {
    
    // MARK: - Other Properties
    
    lazy var currentUser: User? = {
        return Auth.auth().currentUser
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard identifier != "Auth" else {
            return false
        }
        return true
    }
    
    // MARK: - IB Action
    
    @IBAction func tapToLogOut(_ sender: Any) {
        signOutUser()
    }
}
extension SettingsViewController {
    
    // MARK: - Sign Out from application
    
    func signOutUser() {
        do {
            try Auth.auth().signOut()
            self.currentUser = nil
            self.performSegue(withIdentifier: "Auth", sender: self)
        }
        catch {}
    }
}
