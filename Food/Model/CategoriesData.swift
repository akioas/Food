import Foundation

struct CategoriesData: Decodable {
    var dishes: [Dish]
}

struct Dish: Decodable {
    var id: Int
    var name: String
    var price: Int
    var weight: Int
    var description: String
    var imageUrl: String
    var tegs: [String]
}
