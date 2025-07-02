import Foundation

class ApiService: Network, ObservableObject {

    func sendRequest<T>(_ req: Request) async -> Result<T, RequestError> where T: Decodable {

        let result: Result<T, RequestError> = await self.request(req)

        switch result {
        case .success(let responseModel):
            return .success(responseModel)
        case .failure(let errorModel):
            return .failure(errorModel)
        }
    }
}
