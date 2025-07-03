import SwiftUI
import NukeUI

// Detail image view for full-screen
struct FullImageView: View, Identifiable {
    @Environment(\.dismiss) private var dismiss

    let title: String?
    let url: URL?
    var id: String { url?.absoluteString ?? UUID().uuidString }

    var body: some View {
        VStack {
            Text(title ?? Constants.untitledItem)
                .font(.title2.bold())
                .padding(.bottom, 12)

            LazyImage(url: url) { state in
                if let image = state.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } else if state.error != nil {
                    Text(state.error?.localizedDescription ?? "Something went wrong")
                } else {
                    ProgressView()
                }
            }
            .padding()
        }
        .overlay(alignment: .topLeading) {
            closeButton
        }
        .padding(16)
    }

    @ViewBuilder
    private var closeButton: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "xmark.circle.fill")
                .font(.system(size: 28))
                .foregroundColor(.secondary)
        }
    }
}

struct SelectedImage: Identifiable, Equatable {
    let title: String?
    let url: URL?
    var id: String { url?.absoluteString ?? UUID().uuidString }
}
