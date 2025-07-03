import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    @State private var selectedImage: SelectedImage?

    var body: some View {
        ZStack {
            Color(.lightGray).ignoresSafeArea()

            if let pageItem = viewModel.homeModel {
                ScrollView {
                    HierarchyNodeView(
                        pageItem, 0,
                        onImageTap: {
                            selectedImage = $0
                        }
                    )
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(16)
            } else {
                ProgressView()
            }
        }
        .sheet(
            item: $selectedImage,
            content: { tuple in
                FullImageView(title: tuple.title, url: tuple.url)
            }
        )
        .onAppear {
            Task {
                await viewModel.fetch()
            }
        }
        .alert("Error", isPresented: Binding(
            get: { viewModel.error != nil },
            set: { _ in viewModel.dismissError() }
        ), actions: {
            Button("OK", role: .cancel) { viewModel.dismissError() }
        }, message: {
            Text(viewModel.error ?? "Unknown error")
        })
    }
}

#Preview {
    HomeView()
}
