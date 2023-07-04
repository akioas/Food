import Foundation

class DishesData {
    private let cartKey = "cart"
    private let dishesKey = "dishes"
    
    func saveCart(cart: [Int : Int]) {
        if let encoded = try? JSONEncoder().encode(cart) {
            UserDefaults.standard.set(encoded, forKey: cartKey)
        }
    }
    func saveDishes(dishes: [Int : Dish]) {
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
    func getDishes() -> [Int : Dish]? {
        if let data = UserDefaults.standard.object(forKey: dishesKey) as? Data,
           let dishes = try? JSONDecoder().decode([Int : Dish].self, from: data) {
            return dishes
        }
        return nil
    }
    func addToCart(id: Int) {
        if var cart = getCart() {
            if let item = cart[id] {
                if item < 1 {
                    cart[id] = 1
                } else {
                    cart[id]! += 1
                }
                saveCart(cart: cart)
            } else {
                saveCart(cart: [id : 1])
            }
        } else {
            saveCart(cart: [id : 1])
        }
    }
    func removeFromCart(id: Int) {
        if var cart = getCart() {
            if let item = cart[id] {
                if item <= 1 {
                    cart[id] = nil
                } else {
                    cart[id]! -= 1
                }
                saveCart(cart: cart)
            } else {
                UserDefaults.standard.removeObject(forKey: cartKey)
            }
        } else {
            UserDefaults.standard.removeObject(forKey: cartKey)
            
        }
    }
}
