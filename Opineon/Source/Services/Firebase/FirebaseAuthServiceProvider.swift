//
//  FirebaseAuthServiceProvider.swift
//  Opineon
//
//  Created by Deepanshu Agarwal on 21/12/22.
//
import UIKit
import FirebaseAuth
import Firebase
import FirebaseCore

typealias FirestoreDocument = DocumentReference
typealias Document = DocumentSnapshot

class FirebaseAuthServiceProvider {
    
    let cloudFirestore = Firestore.firestore()
    static let shared = FirebaseAuthServiceProvider()
    
    private init() {}
        
        // MARK: - Firbease Auth
        
        func verifyNumber(phone number: String, completion: @escaping (_ providerId: String?, _ error: Error?) -> Void) {
            PhoneAuthProvider.provider().verifyPhoneNumber(number, uiDelegate: nil) { (verificationID, error) in
                guard error == nil else {
                    completion(nil, error)
                    return
                }
                completion(verificationID, nil)
            }
        }
        
        
        
        func signIn(withProviderId providerId: String, oneTimeCode: String, completion: @escaping(_ user: User?, _ error: Error?) -> Void) {
            let credential = PhoneAuthProvider.provider().credential(
                withVerificationID: providerId,
                verificationCode: oneTimeCode)
            Auth.auth().signIn(with: credential) { (authResult, error) in
                guard error == nil, let user = authResult?.user else {
                    completion(nil, error)
                    return
                }
                completion(user, nil)
            }
        }
    }

// MARK: - CRUD Operation
extension FirebaseAuthServiceProvider {
    // 1. CREATE
    // 2. READ
    // 3. UPDATE
    // 4. DELETE
    func createAndUpdateDocument(collectionName collection: String, body userInfo: AppUser,userId userid: String ,completion: @escaping(_ documentID: FirestoreDocument?) -> Void) {
        let collectionReference = cloudFirestore.collection(collection)
        let documentReference = collectionReference.document()
        try? collectionReference.document(userid).setData(from: userInfo,merge: true){
            error in
                guard error != nil else {
                    completion(nil)
                    return
        }
            completion(documentReference)
        }
    }
    
    func create(collectionName collection: String, body: [String: Any], completion: @escaping(_ documentID: FirestoreDocument?) -> Void) {
        let collectionReference = cloudFirestore.collection(collection)
        let documentReference = collectionReference.document()
        collectionReference.addDocument(data: body) { error in
            guard error != nil else {
                completion(nil)
                return
            }
            completion(documentReference)
        }
    }
    
    func read(collectionName collection: String, documentPath path: String, completion: @escaping(_ response: [String: Any]?) -> Void) {
        let collectionReference = cloudFirestore.collection(collection)
        let documentReference = collectionReference.document(path)
        
        documentReference.getDocument { snapshot, error in
            guard var response = snapshot?.data() else {
                completion(nil)
                return
            }
            response[FirebaseKeys.documentId.key] = snapshot!.documentID
            completion(response)
        }
    }
    
    func readDocument(collectionName collection: String, documentPath path: String, completion: @escaping(_ response: Document?) -> Void) {
        let collectionReference = cloudFirestore.collection(collection)
        let documentReference = collectionReference.document(path)
        
        documentReference.getDocument { document, error in
            guard error == nil else {
                completion(nil)
                return
            }
            completion(document)
        }
    }
    
    
    func update(collectionName collection: String, documentPath path: String, body: [String: Any], completion: @escaping(_ status: Bool) -> Void) {
        let collectionReference = cloudFirestore.collection(collection)
        let documentReference = collectionReference.document(path)
        documentReference.setData(body, merge: true) { error in
            completion(error == nil)
        }
    }
    
    func delete(collectionName collection: String, documentPath path: String, completion: @escaping(_ status: Bool) -> Void) {
        let collectionReference = cloudFirestore.collection(collection)
        let documentReference = collectionReference.document(path)
        documentReference.delete { error in
            completion(error == nil)
        }
    }
}

enum FirebaseKeys: String {
    case documentId = "uid"
    
    var key: String {
        return self.rawValue
    }
}
