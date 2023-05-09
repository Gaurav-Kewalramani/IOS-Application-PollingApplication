//
//  UserProfileViewController.swift
//  Opineon
//

//

import UIKit
import FirebaseAuth

class UserProfileViewController: UIViewController {
    
    // MARK: - IB Outlet
    
    let userIdPath = Auth.auth().currentUser?.uid
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userNationality: UILabel!
    @IBOutlet weak var userContinent: UILabel!
    @IBOutlet weak var userLanguage: UILabel!
    @IBOutlet weak var userEducation: UILabel!
    @IBOutlet weak var userOccupation: UILabel!
    @IBOutlet weak var userReligion: UILabel!
    @IBOutlet weak var incomeRange: UILabel!
    @IBOutlet weak var relationship: UILabel!
    @IBOutlet weak var headline: UILabel!
    var viewModel = UserProfileViewModel()
    var addModel = UserAddViewModel()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchUsers { response, error in
            if let res = response {
                print(res.uid)
                print(self.userIdPath)
                if(res.uid == self.userIdPath) {
                    print("res",res)
                    print("Response:",res.name ?? nil)
                    self.userName.text = res.name
                    self.userNationality.text = res.nationality
                    self.userContinent.text = res.contient
                    self.userLanguage.text = res.language
                    self.userEducation.text = res.education
                    self.userOccupation.text = res.occupation
                    self.userReligion.text = res.religion
                    self.incomeRange.text = res.incomeRange
                    self.relationship.text = res.relationship
                    self.headline.text = res.headline
                }
            }
            else {
                print(error?.localizedDescription)
            }
        }
    }
}

