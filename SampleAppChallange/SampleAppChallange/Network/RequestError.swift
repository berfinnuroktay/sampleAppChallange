import Foundation

enum RequestError: Error {

    case decodingError
    case urlError
    case networkError
    case serverError

    var userFriendlyMessage: String {
        switch self {
        case .decodingError, .urlError:
            String("Something went wrong")
        case .networkError:
            String("Check your internet connection")
        case .serverError:
            String("Ups, something is wrong with the server. Please try later.")
        }
    }

    var errorDescription: String? {
        userFriendlyMessage
    }
}
