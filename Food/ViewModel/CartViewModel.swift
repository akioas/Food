import SwiftUI
//для сохранения корзины

class CartViewModel {
    let model = DishesData()
    
    func saveCart(cart: [Int : Int]) {
        model.saveCart(cart: cart)
    }
    func saveDishes(dishes: [Dish]) {
        var dishesDict = [Int : Dish]()
        for dish in dishes {
            dishesDict[dish.id] = dish
        }
        model.saveDishes(dishes: dishesDict)
    }
    func getCart() -> [Int : Int]? {
        model.getCart()
    }
    func getDishes() -> [Int : Dish]? {
        model.getDishes()
    }
    func addToCart(id: Int) {
        model.addToCart(id: id)
    }
    func removeFromCart(id: Int) {
        model.removeFromCart(id: id)
    }
    func calc() -> Int {
        model.getSum()
    }
    
}
