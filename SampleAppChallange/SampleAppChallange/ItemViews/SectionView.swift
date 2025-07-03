import SwiftUI

struct SectionView: View {
    let section: SectionModel
    let level: CGFloat
    let onImageTap: (SelectedImage) -> Void

    private var indent: CGFloat {
        Constants.indentationAmount * level
    }

    private var fontSize: CGFloat {
        Constants.initialSubFontSize - level
    }

    init(_ section: SectionModel, _ level: CGFloat, onImageTap: @escaping (SelectedImage) -> Void) {
        self.section = section
        self.level = level
        self.onImageTap = onImageTap
    }

    var body: some View {
        LazyVStack(alignment: .leading, spacing: 12) {
            Text(section.title ?? Constants.untitledItem)
                .font(.system(size: fontSize, weight: .semibold))
                .padding(.leading, indent)

            ForEach(section.items ?? []) { item in
                HierarchyNodeView(item, level + 1, onImageTap: onImageTap)
            }
        }
    }
}
