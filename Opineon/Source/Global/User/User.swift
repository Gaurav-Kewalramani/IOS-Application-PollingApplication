//
//  User.swift
//  Opineon
//
//  Created by Vansika Jain on 10/01/23.
//

import UIKit

public struct AppUser: Codable {
    
    var uid: String!
    var name: String?
    //var age: Int?
    var nationality: String?
    var education: String?
    var contient: String?
    var incomeRange: String?
    var language: String?
    var occupation: String?
    var religion: String?
    var relationship: String?
    var headline: String?
//    var gender: Gender?
//
//    required init(from decoder: Decoder) throws {
//        let values      = try decoder.container(keyedBy: UserCodingKeys.self)
//        //uid             = try values.decode(String.self, forKey: .uid)
//        name            = try? values.decode(String.self, forKey: .name)
//        age             = try? values.decode(Int.self, forKey: .age)
//        nationality     = try? values.decode(String.self, forKey: .nationality)
//        education       = try? values.decode(String.self, forKey: .education)
//        contient        = try? values.decode(String.self, forKey: .contient)
//        incomeRange     = try? values.decode(String.self, forKey: .incomeRange)
//        language        = try? values.decode(String.self, forKey: .language)
//        occupation      = try? values.decode(String.self, forKey: .occupation)
//        religion        = try? values.decode(String.self, forKey: .religion)
//        relationship    = try? values.decode(String.self, forKey: .relationship)
//        headline        = try? values.decode(String.self, forKey: .headline)
//
//        if let genderValue = try? values.decode(String.self, forKey: .gender) {
//            gender = Gender.init(rawValue: genderValue)
//        }
        
    }
    
//    func encode(to encoder: Encoder) throws {
////        var container = encoder.container(keyedBy: UserCodingKeys.self)
//    }
    
//    enum UserCodingKeys: String, CodingKey {
//       // case uid
//        case name
////        case age
////        case nationality
////        case education
////        case gender
////        case contient
////        case incomeRange
////        case language
////        case occupation
////        case religion
////        case relationship
////        case headline
//    }
//}
//
//

//enum Gender: String {
//    case male =  "male"
//    case female = "female"
//    case trans = "trans"
//}

//extension AppUser {
//  static var empty = AppUser(name: "milo")
////  static var sample = [
////    AppUser(id: "red", name: "Red", color: .red),
////    AppUser(id: "cerise", name: "Cerise", color: Color(hex: "#d52c67"))
////  ]
//}
