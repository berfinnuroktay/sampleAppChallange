import Foundation

protocol Network {

    func request<T: Decodable>(_ request: Request) async -> Result<T, RequestError>
}

extension Network {

    func request<T: Decodable>(_ request: Request) async -> Result<T, RequestError> {

        guard let urlRequest = makeURLRequest(request) else {
            return .failure(.urlError)
        }

        print("=== URL: \(urlRequest.url?.absoluteString ?? "")")

        guard let (data, response) = try? await URLSession.shared.data(for: urlRequest)
                as? (Data, HTTPURLResponse) else {
            return .failure(.networkError)
        }

        #if DEBUG
        let responseString = String(data: data, encoding: .utf8) ?? ""
        print("=== Status of \(request.path): \(response.statusCode)")
        print("=== Response of \(request.path): \(responseString)")
        #endif

        guard case 200 = response.statusCode else {
            return .failure(.serverError)
        }

        do {
            let model = try JSONDecoder().decode(T.self, from: data)
            return .success(model)
        } catch {
            print("=== Decoding error of \(request.path): \(error)")
            return .failure(.decodingError)
        }
    }

    /// Creates an URL request from given request.
    /// - Parameter request: request to be made
    /// - Returns: nil in case of nor url, url request for success.
    /// This method is made for scalability.
    /// If additional parameters, or device info etc. needed, it can be added with ease.
    private func makeURLRequest(_ request: Request) -> URLRequest? {

        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "mocki.io"
        urlComponents.path = "/v1/\(request.path)".replacingOccurrences(of: "//", with: "/")

        guard let url = urlComponents.url else { return nil }

        let urlRequest = URLRequest(url: url)

        return urlRequest
    }
}
