import Foundation

struct SectionModel: Codable, Identifiable {
    let type: ItemType
    let title: String?
    let items: [HierarchyItem]?
    var id = UUID()

    enum CodingKeys: String, CodingKey {
        case type, title, items
    }
}
