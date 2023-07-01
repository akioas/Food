import Foundation

class CategoriesViewModel: ViewModel {
    
    @Published var dishes: [Dish]?
    var url: String = "aba7ecaa-0a70-453b-b62d-0e326c859b3b"
    var apiManager: APIManager = APIManager()
    
    func getData() {
        apiManager.fetch(url: url) { (result: Result<CategoriesData, Error>) in
            switch result {
            case .success(let result):
                self.dishes = result.dishes.sorted(by: {$0.id < $1.id})
            case .failure(let error):
                print(error)
            }
        }
    }
}
