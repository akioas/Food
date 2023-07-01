import Foundation

struct MainData: Decodable {
    var сategories: [Category]
}

struct Category: Decodable {
    var id: Int
    var name: String
    var imageUrl: String
}
