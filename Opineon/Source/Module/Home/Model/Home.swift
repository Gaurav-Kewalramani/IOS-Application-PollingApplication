//
//  HomeModel.swift
//  Opineon
//
//  Created by Gaurav Kewalramani on 22/12/22.
//

import UIKit

 // MARK: - Firestore Data model

struct Users {
    var id : String
    var name : String
}

struct Surveys {
    var id : String
    var comments_count: Int?
    var correct_answer: String?
    var created_at: Int?
    var description: String?
    var description_media_type: Int?
    var duration : Int?
    var like_count: Int?
//    var location: [Location]
//    var options: [String]
    var reshare_count : Int?
//    var settings: [Settings]
    var title : String?
    var updated_at: Int?
    var user_id: String?
    var vote_count: Int?
}
//struct Location: Codable {
//var city: String
//var country: String
//var province: String
//}
//
//struct Settings {
//var is_anonymous: Bool
//var is_multi_answer : Bool
//var is_quiz: Bool
//var should_reveal_demographics: Bool
//var should_reveal_vote_percentage : Bool
//}
//
