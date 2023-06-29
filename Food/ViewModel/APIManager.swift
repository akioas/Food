

import Foundation
import Combine


class APIManager {
    
    private let baseURL = "https://run.mocky.io/v3/"
    
    enum Screen: String {
        case main = "058729bd-1402-4578-88de-265481fd7d54"
        case categories = "aba7ecaa-0a70-453b-b62d-0e326c859b3b"
    }
    
    private var subscriber = Set<AnyCancellable>()
    private let decoder: JSONDecoder
    init() {
        decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func fetch<T: Decodable>(screen: Screen, completion: @escaping (Result<T, Error>) -> Void )  {
        guard let url = URL(string: (baseURL + screen.rawValue)) else {
            return
        }
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: T.self, decoder: decoder)
            .receive(on: DispatchQueue.main)
        
            .sink { (resultCompletion) in
                switch resultCompletion {
                case .failure(let error):
                    print(error)
                    completion(.failure(error))
                case .finished:
                    return
                }
            } receiveValue: { (result) in
                completion(.success(result))
            }
            .store(in: &subscriber)
    }
}
