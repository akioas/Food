import Foundation

class MainViewModel: ObservableObject {
    
    @Published var dishes: [Dish]?
    private let apiManager: APIManager = APIManager()
    private let url = "aba7ecaa-0a70-453b-b62d-0e326c859b3b"
    
    func getData() {
        apiManager.fetch(url: url) { (result: Result<MainData, Error>) in
            switch result {
            case .success(let result):
                self.dishes = result.dishes.sorted(by: {$0.id < $1.id})
            case .failure(let error):
                print(error)
            }
        }
    }
}
