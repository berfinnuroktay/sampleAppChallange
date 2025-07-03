import SwiftUI

struct PageView: View {
    let page: PageModel
    let level: CGFloat
    let onImageTap: (SelectedImage) -> Void

    private var indent: CGFloat {
        Constants.indentationAmount * level
    }

    init(_ page: PageModel, level: CGFloat, onImageTap: @escaping (SelectedImage) -> Void) {
        self.page = page
        self.level = level
        self.onImageTap = onImageTap
    }

    var body: some View {
        LazyVStack(alignment: .leading, spacing: 8) {
            Text(page.title ?? Constants.untitledItem)
                .font(.system(size: Constants.pageFontSize, weight: .bold))
                .padding(.leading, indent)

            ForEach(page.items ?? []) { item in
                HierarchyNodeView(item, level + 1, onImageTap: onImageTap)
            }
        }
    }
}
