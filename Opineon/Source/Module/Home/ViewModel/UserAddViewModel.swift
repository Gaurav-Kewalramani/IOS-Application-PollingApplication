//
//  UserAddViewModel.swift
//  Opineon
//
//  Created by Vansika Jain on 27/01/23.
//

import UIKit
import Firebase
import FirebaseAuth

class UserAddViewModel: NSObject,ObservableObject {
    // @Published var userInitialData: AppUser
    //    @Published var userData: AppUser = .empty
    private static let userId = Auth.auth().currentUser?.uid
    //    init(userInitialData: AppUser = AppUser(uid: UserAddViewModel.userId,name :"")) { // (2)
    //        self.userInitialData = userInitialData
    //    }
    //
    func addUser(initialdata data:AppUser) {
        //print("UserId:",UserAddViewModel.userId!)
        let firebaseService = FirebaseAuthServiceProvider.shared
        firebaseService.createAndUpdateDocument(collectionName: "users", body: data, userId: UserAddViewModel.userId!) { documentID in
            guard let firebaseDocument = documentID else {
                return
            }
            do {
                let userId = firebaseDocument.documentID
                print("Book stored with new document reference: \(userId)")
            } catch {
                print("Exception: \(error.localizedDescription)")
            }
        }
    }
}
