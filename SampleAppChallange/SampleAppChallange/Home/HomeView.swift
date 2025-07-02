import SwiftUI

struct HomeView: View {

    @StateObject var viewModel = HomeViewModel()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            Task {
                viewModel.fetch()
            }
        }
    }
}

#Preview {
    HomeView()
}
