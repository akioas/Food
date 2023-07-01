import Foundation

class MainViewModel: ViewModel {
    
    @Published var categories: [Category]?
    var url: String = "058729bd-1402-4578-88de-265481fd7d54"
    var apiManager: APIManager = APIManager()
    
    func getData() {
        apiManager.fetch(url: url) { (result: Result<MainData, Error>) in
            switch result {
            case .success(let result):
                self.categories = result.сategories.sorted(by: {$0.id < $1.id})
            case .failure(let error):
                print(error)
            }
        }
    }
}

