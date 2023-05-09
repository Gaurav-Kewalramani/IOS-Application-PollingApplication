//
//  UserProfileViewModel.swift
//  Opineon
//

import UIKit
import Firebase
import FirebaseFirestore

class UserProfileViewModel: NSObject,ObservableObject {
    // @Published var appUser = [AppUser]()
    private var db = Firestore.firestore()
    let userIdPath = Auth.auth().currentUser?.uid
    func fetchUsers(completion:@escaping (AppUser?,Error?)-> Void ) {
        db.collection("users").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            print("Documents:",documents)
            do{
                try? documents.map { queryDocumentSnapshot -> Void in
                    print("Data:",queryDocumentSnapshot.data())
                    let appUser = try queryDocumentSnapshot.data(as: AppUser.self)
                    print("User:",appUser)
                    completion(appUser,nil)
                }
            }
        }
    }
}
