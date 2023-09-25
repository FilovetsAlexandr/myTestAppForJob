import Foundation

struct PhotoTypesListResponse: Decodable {
    var content: [PhotoDTO]
    var page: Int?
    var pageSize: Int?
    var totalElements: Int?
    var totalPages: Int?
}
