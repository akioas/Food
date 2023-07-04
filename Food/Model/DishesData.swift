import Foundation
//для сохранения корзины
class DishesData {
    private let cartKey = "cart"
    private let dishesKey = "dishes"
    private let calcKey = "calc"
    
    func saveCart(cart: [Int : Int]) {
        if let encoded = try? JSONEncoder().encode(cart) {
            UserDefaults.standard.set(encoded, forKey: cartKey)
        }
        UserDefaults.standard.set(calc(), forKey: calcKey)
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
                    if cart[id]! < 99 {
                        cart[id]! += 1
                    }
                }
                saveCart(cart: cart)
            } else {
                cart[id] = 1
                saveCart(cart: cart)
            }
        } else {
            saveCart(cart: [id : 1])
        }
    }
    func removeFromCart(id: Int) {

        if var cart = getCart() {
            print(cart)
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
    func calc() -> Int {
        var sum = 0
        if let cart = getCart() {
            if let dishes = getDishes() {
                for (key, value) in cart {
                    sum += value * (dishes[key]?.price ?? 0)
                }
            }
        }
        return sum
    }
    func getSum() -> Int {
        UserDefaults.standard.integer(forKey: calcKey)
    }
}
