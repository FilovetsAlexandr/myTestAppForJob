import Alamofire
import Combine
import Foundation

final class WebClient<T: Decodable> {
    private let baseURL = "https://junior.balinasoft.com"

    func request(path: String, method: HTTPMethod = .get, parameters: Parameters? = nil, encoding: ParameterEncoding = URLEncoding.default) -> AnyPublisher<T, Error> {
        return AF.request(baseURL + path, method: method, parameters: parameters, encoding: encoding)
            .validate()
            .publishData()
            .tryMap { output in
                guard let httpResponse = output.response, httpResponse.statusCode == 200 else { throw BaseServiceError.badRequest }
                if let result = try? JSONDecoder().decode(T.self, from: output.data ?? Data()) {
                    return result
                } else { throw BaseServiceError.decodableError }
            }
            .eraseToAnyPublisher()
    }

    func request(path: String, method: HTTPMethod = .post, headers: HTTPHeaders? = nil, multipartFormData: @escaping (MultipartFormData) -> Void) -> AnyPublisher<T, Error> {
        AF.upload(
            multipartFormData: multipartFormData,
            to: URL(string: baseURL + path)!,
            method: method,
            headers: headers
        )
        .validate()
        .publishData()
        .tryMap { output in
            guard let httpResponse = output.response, httpResponse.statusCode == 200 else { throw BaseServiceError.badRequest }
            if let result = try? JSONDecoder().decode(T.self, from: output.data ?? Data()) {
                return result
            } else {
                throw BaseServiceError.decodableError
            }
        }
        .eraseToAnyPublisher()
    }
}
