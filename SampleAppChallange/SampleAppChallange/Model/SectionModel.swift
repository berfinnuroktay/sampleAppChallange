import Foundation

struct SectionModel: Decodable, Identifiable {
    let type: ItemType
    let title: String?
    let items: [HierarchyItem]?
    var id = UUID()

    enum CodingKeys: String, CodingKey {
        case type, title, items
    }
}
