import Foundation

struct QuestionModel: Codable, Identifiable {
    let type: ItemType
    let imageURL: URL?
    let title: String?
    var id = UUID()

    enum CodingKeys: String, CodingKey {
        case type
        case imageURL = "src"
        case title
    }
}
