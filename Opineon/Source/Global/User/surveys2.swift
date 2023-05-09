////
////  surveys2.swift
////  Opineon
////
////  Created by Gaurav Kewalramani on 13/01/23.
////
//
//import UIKit
//import Firebase
//import FirebaseFirestore
//
//
//class Surveys2 : Codable {
//    var title: String?
//    var createdAt: String?
//    var description: String?
//    var testing: String?
//    var likes: Int?
//    var user_id : UserId?
//
//
//
//
//    required init( from decoder : Decoder ) throws {
//        let values = try decoder.container(keyedBy: SurveyCodingKeys.self)
//        description = try? values.decode(String.self, forKey: .description)
//        createdAt = try? values.decode(String.self, forKey: .createdAt)
//        title = try? values.decode(String.self, forKey: .title)
//        testing = try? values.decode(String.self, forKey: .testing)
//        likes = try? values.decode(Int.self, forKey: .likes)
//        user_id = try values.decode(UserId.self, forKey: .user_id)
//    }
//
//    func encode(to encoder: Encoder) throws {
////        var container = encoder.container(keyedBy: UserCodingKeys.self)
//    }
//
//    enum SurveyCodingKeys : CodingKey {
//        case title
//        case description
//        case createdAt
//        case testing
//        case likes
//        case user_id
//    }
//}
//
//struct UserId : Codable {
//    let userId: String?
//    var docRef : DocumentReference {
//        return Firestore.firestore().document(userId ?? "")
//    }
//}
