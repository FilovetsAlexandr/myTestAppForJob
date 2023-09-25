import Alamofire
import Combine
import Foundation

final class ServiceImpl: Service {
    func postPhoto(input: PostPhotoInput) -> AnyPublisher<PostPhotoResponse, Error> {
        return WebClient<PostPhotoResponse>().request(path: "/api/v2/photo") { multipartFormData in
            multipartFormData.append(input.photo, withName: "photo", fileName: "photo.png", mimeType: "image/png")
            multipartFormData.append(Data(input.name.utf8), withName: "name")
        }
    }

    func getPhotoTypesList(page: Int) -> AnyPublisher<PhotoTypesListResponse, Error> {
        let parameters: Parameters = ["page": page]
        return WebClient<PhotoTypesListResponse>().request(path: "/api/v2/photo/type", method: .get, parameters: parameters)
    }
}
