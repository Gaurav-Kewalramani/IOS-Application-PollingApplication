//
//  LaunchViewController.swift
//  Opineon
//
//  Created by Rohit Kumar on 15/11/22.
//

import UIKit
import Firebase
import FirebaseFirestore

class LaunchViewController: UIViewController {
//    @Published var userData: AppUser = .empty
    var userId = Auth.auth().currentUser?.uid
    
    // MARK: - PROPERTY
    
    let viewModel = LaunchScreenViewModel()
    
    // MARK: - LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    // MARK: - Setup
    
    func setup() {
        if (viewModel.isLoggedIn()) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2)  { [weak self] in
                self?.gotoHomeScreen()
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2)  { [weak self] in
                self?.gotoLoginScreen()
            }
            
        }
        
        // TODO: - REMOVE THIS DUMMY CODE
        fetchUsers()
        //addBook()
        
    }
    
    func fetchUsers() {
        let firebaseService = FirebaseAuthServiceProvider.shared
        firebaseService.readDocument(collectionName: "surveys", documentPath: "3vuOp804cWgkZLfHt3bz") { document in
            guard let firebaseDocument = document else {
                return
            }
            do {
                let survey = try firebaseDocument.data(as: AppSurvey.self)
                print("Tag1: Survey data UID : \(String(describing: survey.uid))")
                print("Tag1: Survey data vote : \(String(describing: survey.voteCount))")
                print("Tag1: Survey data vote : \(String(describing: survey))")
                print("Tag1: User Ref : \(String(describing: survey.userID.documentID))")
            } catch {
                print("Exception: \(error.localizedDescription)")
            }
            
        }
    }
//    func addBook() {
//        print(userId!)
//        let firebaseService = FirebaseAuthServiceProvider.shared
//        firebaseService.createAndUpdateDocument(collectionName: "users", body: self.userData, userId: userId!) { documentID in
//            guard let firebaseDocument = documentID else {
//                return
//            }
//            do {
//                let userId = firebaseDocument.documentID
//                print("Book stored with new document reference: \(userId)")
//            } catch {
//                print("Exception: \(error.localizedDescription)")
//            }
//
//        }
//    }
}

// MARK: - NAVIGATION

extension LaunchViewController {
    
    func gotoHomeScreen() {
        let homeController = UIStoryboard.viewController(in: .home, withIdentifier: .homeViewController)
        navigationController?.pushViewController(homeController, animated: true)

    }
    
    func gotoLoginScreen() {
        let phoneAuthController = UIStoryboard.viewController(in: .auth, withIdentifier: .authViewContoller)
        navigationController?.pushViewController(phoneAuthController, animated: true)
    }
}
