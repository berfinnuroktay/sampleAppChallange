import Foundation

struct QuestionModel: Decodable {
    let type: ItemType
    let imageURL: URL?
    let title: String?

    enum CodingKeys: String, CodingKey {
        case type
        case imageURL = "src"
        case title
    }
}

enum ItemType: String, Decodable {
    case page
    case section
    case textQuestion = "text"
    case imageQuestion = "image"
}
