import SwiftUI

struct HierarchyNodeView: View {
    let item: HierarchyItem
    let level: CGFloat
    let onImageTap: (SelectedImage) -> Void

    init(_ item: HierarchyItem, _ level: CGFloat, onImageTap: @escaping (SelectedImage) -> Void) {
        self.item = item
        self.level = level
        self.onImageTap = onImageTap
    }

    var body: some View {
        switch item {
        case .page(let pageModel):
            PageView(pageModel, level: CGFloat(0), onImageTap: onImageTap)
        case .section(let sectionModel):
            SectionView(sectionModel, level, onImageTap: onImageTap)
        case .textQuestion(let questionModel):
            TextQuestionView(questionModel, level)
        case .imageQuestion(let questionModel):
            ImageQuestionView(questionModel, level, onImageTap: onImageTap)
        }
    }
}
