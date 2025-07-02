import Foundation

@MainActor
final class HomeViewModel: ObservableObject {

    @Published var homeModel: [PageModel]?

    private let homeService = HomeService()

    func fetch() {
        Task {
            switch await homeService.fetch() {
            case .success(let result):
                print("=== success: \(result)")
            case .failure(let error):
                // TODO: show dialog here
                print("=== error: \(error)")
            }
        }
    }
}
