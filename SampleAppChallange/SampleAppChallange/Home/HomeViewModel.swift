import Foundation

@MainActor
final class HomeViewModel: ObservableObject {

    @Published var homeModel: HierarchyItem?

    private let homeService = HomeService()

    func fetch() async {
        Task {
            switch await homeService.fetch() {
            case .success(let result):
                homeModel = result
                print("=== success: \(result)")
            case .failure(let error):
                // TODO: show dialog here
                print("=== error: \(error)")
            }
        }
    }
}
