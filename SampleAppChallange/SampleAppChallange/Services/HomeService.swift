import Foundation

struct HomeService {

    @Injected(\.apiService) private var apiService: ApiService

    func fetch() async -> Result<HierarchyItem, RequestError> {
        let result: Result<HierarchyItem, RequestError> = await apiService.sendRequest(
            Request.Builder(path: "f118b9f0-6f84-435e-85d5-faf4453eb72a")
                .build()
        )

        switch result {
        case.success(let model):
            Cache.saveIfNew(model)
            return .success(model)
        case .failure:
            if let cachedData = Cache.load(HierarchyItem.self) {
                return .success(cachedData)
            } else {
                return .failure(.networkError)
            }
        }
    }

}
