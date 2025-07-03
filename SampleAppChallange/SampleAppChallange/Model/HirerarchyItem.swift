import Foundation

enum ItemType: String, Codable {
    case page
    case section
    case textQuestion = "text"
    case imageQuestion = "image"
}

indirect enum HierarchyItem: Codable, Identifiable, Equatable {

    static func == (lhs: HierarchyItem, rhs: HierarchyItem) -> Bool {
        lhs.id == rhs.id
    }
    
    case page(PageModel)
    case section(SectionModel)
    case textQuestion(QuestionModel)
    case imageQuestion(QuestionModel)

    var id: UUID {
        switch self {
        case .page(let page): return page.id
        case .section(let section): return section.id
        case .textQuestion(let question): return question.id
        case .imageQuestion(let question): return question.id
        }
    }

    private enum CodingKeys: String, CodingKey {
        case type
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(ItemType.self, forKey: .type)
        switch type {
        case .page:
            self = .page(try PageModel(from: decoder))
        case .section:
            self = .section(try SectionModel(from: decoder))
        case .textQuestion:
            self = .textQuestion(try QuestionModel(from: decoder))
        case .imageQuestion:
            self = .imageQuestion(try QuestionModel(from: decoder))
        }
    }

    func encode(to encoder: any Encoder) throws {
        switch self {
        case .page(let pageModel):
            try pageModel.encode(to: encoder)
        case .section(let sectionModel):
            try sectionModel.encode(to: encoder)
        case .textQuestion(let questionModel):
            try questionModel.encode(to: encoder)
        case .imageQuestion(let questionModel):
            try questionModel.encode(to: encoder)
        }
    }
}
