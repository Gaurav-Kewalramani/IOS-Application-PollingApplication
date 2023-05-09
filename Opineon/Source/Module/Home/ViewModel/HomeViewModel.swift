//
//  HomeViewModel.swift
//  Opineon
//
//  Created by Gaurav Kewalramani on 22/12/22.
//

import UIKit
import Firebase
import FirebaseFirestore

class HomeViewModel: NSObject, ObservableObject {
    
    // MARK: - Other Properties
    
    @Published var userList = [Users]()
    @Published var surveyList = [Surveys]()
    
    // MARK: - Fetching User Data from Firestore
    
    func getUserData(completion:@escaping ([Users]?,Error?)-> Void) {
        
        //get the reference of the database
        let db = Firestore.firestore()
        
        //read the data from the specific path rom the database
        db.collection("users").getDocuments {
            
            // check for error and document
            snapshot, error in
            guard error == nil else {
                print(error?.localizedDescription ?? "ERROR")
                completion(nil,error)
                return
            }
            
            // update the userList property in the main thread
            if let snapshot = snapshot {
                
                //get all the documents and create users
                self.userList = snapshot.documents.map { data in
                    
                    // create a User item for each user returned
                    let name = data["name"] as? String ?? ""
                    return Users (id:data.documentID,name:name)
                }
                completion(self.userList,nil)
            }
        }
    }
    
    // MARK: - Fetching Survey Data from Firestore
    
    func getSurveyData(completion:@escaping ([Surveys]?,Error?)-> Void) {
        
        let db = Firestore.firestore()
        db.collection("surveys").getDocuments {
            
            // check for error and document
            snapshot, error in
            guard error == nil else {
                print(error?.localizedDescription ?? "ERROR")
                completion(nil,error)
                return
            }
            // update the surveyList property in the main thread
            if let snapshot = snapshot {
                
                //get all the documents and create surveys
                self.surveyList = snapshot.documents.map { data in
                    
                    // create a Surveys item for each survey returned
                    let comments_count = data["comments_count"] as? Int
                    let description = data["description"] as? String ?? ""
                    let like_count = data["like_count"] as? Int
                    let reshare_count = data["reshare_count"] as? Int
                    let title = data["title"] as? String ?? ""
                    let vote_count = data["vote_count"] as? Int
                    return Surveys (id:data.documentID,comments_count:comments_count,description:description,like_count:like_count,reshare_count:reshare_count,title:title,vote_count:vote_count)
                }
                completion(self.surveyList,nil)
            }
        }
    }
}







//extension HomeViewModel {
//    func feeds() {
//
//    }
//}
