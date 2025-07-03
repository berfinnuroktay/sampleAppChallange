import SwiftUI

// Detail image view for full-screen
struct FullImageView: View, Identifiable {
    let title: String?
    let url: URL?
    var id: String { url?.absoluteString ?? UUID().uuidString }

    var body: some View {
        VStack {
            if let title {
                Text(title)
                    .font(.title2.bold())
                    .padding(.bottom, 12)
            }
            if let url {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
            } else {
                Text("Image not available")
            }
        }
        .padding()
    }
}

struct SelectedImage: Identifiable, Equatable {
    let title: String?
    let url: URL?
    var id: String { url?.absoluteString ?? UUID().uuidString }
}
