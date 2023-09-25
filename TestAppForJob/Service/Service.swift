import Combine
import Foundation

protocol Service {
    func postPhoto(input: PostPhotoInput) -> AnyPublisher<PostPhotoResponse, Error>
    func getPhotoTypesList(page: Int) -> AnyPublisher<PhotoTypesListResponse, Error>
}
