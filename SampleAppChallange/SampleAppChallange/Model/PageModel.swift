import Foundation

struct PageModel: Decodable {
    let type: ItemType
    let title: String?
    let items: [SectionModel]?
}
