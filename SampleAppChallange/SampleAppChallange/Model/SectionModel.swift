import Foundation

struct SectionModel: Decodable {
    let type: ItemType
    let title: String?
    let items: [QuestionModel]?
}
