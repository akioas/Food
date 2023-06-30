import Foundation

struct MainData: Decodable {
    var dishes: [Dish]
}

struct Dish: Decodable {
    var id: Int
    var name: String
    var price: Int
    var weight: Int
    var description: String
    var image_url: String
    var tegs: [String]
}
