import SwiftUI

struct TextQuestionView: View {
    let question: QuestionModel
    let level: CGFloat

    private var indent: CGFloat {
        Constants.indentationAmount * CGFloat(level)
    }

    private var fontSize: CGFloat {
        Constants.initialSubFontSize - CGFloat(level)
    }

    init(_ question: QuestionModel, _ level: CGFloat) {
        self.question = question
        self.level = level
    }

    var body: some View {
        Text(question.title ?? Constants.untitledItem)
            .font(.system(size: fontSize))
            .padding(.leading, indent)
    }
}
