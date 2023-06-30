import Foundation

struct CategoriesData: Decodable {
    var categories: [Category]
}

struct Category: Decodable {
    var id: Int
    var name: String
    var imageUrl: String
}
