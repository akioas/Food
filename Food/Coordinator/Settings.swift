
import SwiftUI
//если надо сделать экран серым при выводе блюда
class Settings: ObservableObject {
    @Published var isShowing = false
    @Published var dish: Dish?

}

