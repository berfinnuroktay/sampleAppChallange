import Foundation

@MainActor
final class HomeViewModel: ObservableObject {

    @Published var homeModel: HierarchyItem?
    @Published var error: String?

    private let homeService = HomeService()

    func fetch() async {
        Task {
            switch await homeService.fetch() {
            case .success(let result):
                homeModel = result
            case .failure(let error):
                self.error = error.localizedDescription
            }
        }
    }

    func dismissError() {
        error = nil
    }
}
