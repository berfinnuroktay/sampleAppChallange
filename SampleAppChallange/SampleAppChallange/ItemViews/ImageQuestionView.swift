import SwiftUI
import NukeUI

struct ImageQuestionView: View {
    let question: QuestionModel
    let level: CGFloat
    let onImageTap: (SelectedImage) -> Void

    private var indent: CGFloat {
        Constants.indentationAmount * level
    }

    private var fontSize: CGFloat {
        Constants.initialSubFontSize - (level * Constants.reduceFontMultiplier)
    }

    init(_ question: QuestionModel, _ level: CGFloat, onImageTap: @escaping (SelectedImage) -> Void) {
        self.question = question
        self.level = level
        self.onImageTap = onImageTap
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(question.title ?? Constants.untitledItem)
                .font(.system(size: fontSize))
                .padding(.leading, indent)

            Button {
                onImageTap(SelectedImage(title: question.title, url: question.imageURL))
            } label: {
                imageView
            }
            .buttonStyle(.plain)
        }
    }

    @ViewBuilder
    private var imageView: some View {
        LazyImage(url: question.imageURL) { state in
            if let image = state.image {
                image.resizable()
            } else if state.error != nil {
                Text(state.error?.localizedDescription ?? "Something went wrong")
            } else {
                ProgressView()
            }
        }
        .frame(width: 150, height: 150)
        .padding(.leading, indent)
    }
}
