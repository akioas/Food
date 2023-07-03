import Foundation

class DishesData {
    private let cartKey = "cart"
    private let dishesKey = "dishes"
    
    func saveCart(cart: [Int : Int]) {
        print("saved")
        if let encoded = try? JSONEncoder().encode(cart) {
            UserDefaults.standard.set(encoded, forKey: cartKey)
        }
    }
    func saveDishes(dishes: [Dish]) {
        if let encoded = try? JSONEncoder().encode(dishes) {
            UserDefaults.standard.set(encoded, forKey: dishesKey)
        }
    }
    func getCart() -> [Int : Int]? {
        if let data = UserDefaults.standard.object(forKey: cartKey) as? Data,
           let cart = try? JSONDecoder().decode([Int : Int].self, from: data) {
            return cart
        }
        return nil
    }
    func getDishes() -> [Dish]? {
        if let data = UserDefaults.standard.object(forKey: dishesKey) as? Data,
           let dishes = try? JSONDecoder().decode([Dish].self, from: data) {
            return dishes
        }
        return nil
    }
    func addToCart(id: Int) {
        if var cart = getCart() {
            if cart[id] ?? 0 < 1 {
                cart[id] = 1
                saveCart(cart: cart)
            }
        } else {
            saveCart(cart: [id : 1])
        }
    }
}
