import Foundation

struct HomeService {

    @Injected(\.apiService) private var apiService: ApiService

    func fetch() async -> Result<PageModel, RequestError> {
        await apiService.sendRequest(
            Request.Builder(path: "f118b9f0-6f84-435e-85d5-faf4453eb72a")
                .build()
        )
    }

}
