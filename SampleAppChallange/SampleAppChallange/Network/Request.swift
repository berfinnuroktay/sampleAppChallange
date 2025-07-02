import Foundation

struct Request {

    let path: String
    let parameters: [String: Any]
    let headers: [String: Any]
    let method: RequestMethod

    class Builder {
        private var path: String
        private var parameters: [String: Any] = [:]
        private var headers: [String: Any] = [:]
        private var method: RequestMethod = .get

        init(path: String) {
            self.path = path
        }

        func setParameters(_ parameters: [String: Any]) -> Builder {
            self.parameters = parameters
            return self
        }

        func setHeaders(_ headers: [String: Any]) -> Builder {
            self.headers = headers
            return self
        }

        func setMethod(_ method: RequestMethod) -> Builder {
            self.method = method
            return self
        }

        func build() -> Request {
            Request(path: path, parameters: parameters, headers: headers, method: method)
        }
    }
}

enum RequestMethod: String {

    case get = "GET"
}
