import Foundation

class CategoriesViewModel: ViewModel {
    
    @Published var dishes: [Dish]?
    @Published var categories: [String]?
    var url: String = "aba7ecaa-0a70-453b-b62d-0e326c859b3b"
    var apiManager: APIManager = APIManager()
    static let defaultCategory = "Все меню"
    
    func getData() {
        apiManager.fetch(url: url) { (result: Result<CategoriesData, Error>) in
            switch result {
            case .success(let result):
                self.dishes = result.dishes.sorted(by: {$0.id < $1.id})
                self.getCategories()
                if let dishes = self.dishes {
                    CartViewModel().saveDishes(dishes: dishes)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    private func getCategories() {
        var categoriesSet = Set<String>()
        if let dishes = self.dishes {
            for dish in dishes {
                for tag in dish.tegs {
                    categoriesSet.insert(tag)
                }
            }
        }
        categoriesSet.remove(CategoriesViewModel.defaultCategory)
        self.categories = [CategoriesViewModel.defaultCategory] + Array(categoriesSet)
    }
}
