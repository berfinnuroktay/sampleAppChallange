import SwiftUI

struct ImageQuestionView: View {
    let question: QuestionModel
    let level: CGFloat
    let onImageTap: (SelectedImage) -> Void

    private var indent: CGFloat {
        Constants.indentationAmount * level
    }

    private var fontSize: CGFloat {
        Constants.initialSubFontSize - level
    }

    init(_ question: QuestionModel, _ level: CGFloat, onImageTap: @escaping (SelectedImage) -> Void) {
        self.question = question
        self.level = level
        self.onImageTap = onImageTap
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(question.title ?? Constants.untitledItem)
                .font(.system(size: Constants.initialSubFontSize - level))
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
        AsyncImage(url: question.imageURL) { state in
            switch state {
            case .success(let image):
                image.resizable()
            case .failure:
                Color.red
            default:
                Color.gray.opacity(0.3)
            }
        }
        .frame(width: 150, height: 150)
        .padding(.leading, indent)
    }
}
