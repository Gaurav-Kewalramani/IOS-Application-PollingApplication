//
//  AuthenticationViewModel.swift
//  Opineon
//
//  Created by Aniket Kumar on 20/12/22.
//

import UIKit
import Firebase
import FirebaseAuth

class AuthenticationViewModel: NSObject {
    let firebaseServiceObject = FirebaseAuthServiceProvider.shared
 
   
      // MARK: - Authenticating user's number.
      
      func authenticateNumber(withPhoneNumnber phoneNumber: String, completion: @escaping (_ providerId: String?, _ error: Error?) -> Void) {
          print("autheticate: " + phoneNumber)
          self.firebaseServiceObject.verifyNumber(phone: phoneNumber) { (providerId, error) in
              completion(providerId, error)
          }
      }
    
    // MARK: - Validating one time code recieved from user.
    
    func signIn(withProviderId providerId: String, oneTimeCode: String, completion: @escaping(_ user: User?, _ error: Error?) -> Void) {
        self.firebaseServiceObject.signIn(withProviderId: providerId, oneTimeCode: oneTimeCode) {  (user, error) in
            guard let firebaseUser = user else {
                print("Error: " + (error?.localizedDescription ?? "something wrong happend"))
                return
            }
            completion(firebaseUser, error)
        }
    }
}
