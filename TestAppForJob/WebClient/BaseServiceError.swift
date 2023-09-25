import Foundation

enum BaseServiceError: Error {
    case badRequest
    case decodableError
}

extension BaseServiceError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .badRequest: "BadRequest"
        case .decodableError: "DecodableError"
        }
    }
}
