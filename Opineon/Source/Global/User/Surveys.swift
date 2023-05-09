import UIKit
import FirebaseFirestoreSwift

struct AppSurvey: Codable {
    @DocumentID var uid: String!
    var commentsCount: Int?
    var correctAnswer: String?
    var createdAt: Int?
    var description: String?
    var descriptionMediaType: Int?
    var duration: Int?
    var likeCount: Int?
    var location : Location?
    var options: [String]?
    var reshareCount: Int?
    var settings: Setting?
    var title: String!
    var updatedAt: Int?
    var voteCount: Int?
    var userID: FirestoreDocument!
    
    enum CodingKeys: String, CodingKey {
        case uid
        case commentsCount = "comments_count"
        case correctAnswer = "correct_answer"
        case createdAt = "created_at"
        case description
        case descriptionMediaType = "description_media_type"
        case duration
        case likeCount
        case location
        case options
        case reshareCount = "reshare_count"
        case settings
        case title
        case updatedAt = "updated_at"
        case voteCount = "vote_count"
        case userID = "user_id"
    }
}

struct Location : Codable {
    var city : String?
    var country : String?
    var province : String?

    enum LocationCodingKeys: String,CodingKey {
    case city
    case country
    case province
    }
     init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: LocationCodingKeys.self)
    city = try values.decode(String.self, forKey: .city)
    country  = try? values.decode(String.self, forKey: .country)
    province = try? values.decode(String.self, forKey: .province)
     }

}
struct Setting : Codable {
    var isAnonymous : Bool?
    var isMultiAnswer : Bool?
    var isQuiz : Bool?
    var shouldRevealDemographics : Bool?
    var shouldrevealVotePercentage : Bool?

    enum SettingCodingKeys: String,CodingKey {
        case isAnonymous = "is_anonymous"
        case isMultiAnswer = "is_multi_answer"
        case isQuiz = "is_quiz"
        case shouldRevealDemographics = "should_reveal_demographics"
        case shouldrevealVotePercentage = "should_reveal_vote_percentage"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: SettingCodingKeys.self)
        isAnonymous = try values.decode(Bool.self, forKey: .isAnonymous)
        isMultiAnswer = try? values.decode(Bool.self, forKey: .isMultiAnswer)
        isQuiz = try? values.decode(Bool.self, forKey: .isQuiz)
        shouldRevealDemographics = try? values.decode(Bool.self, forKey: .shouldRevealDemographics)
        shouldrevealVotePercentage = try? values.decode(Bool.self, forKey: .shouldrevealVotePercentage)
    }
}

