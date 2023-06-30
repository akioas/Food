

import Foundation
import Combine


class APIManager {
    
    private let baseURL = "https://run.mocky.io/v3/"
    
  //"058729bd-1402-4578-88de-265481fd7d54"
    
    private var subscriber = Set<AnyCancellable>()
    private let decoder: JSONDecoder
    init() {
        decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func fetch<T: Decodable>(url: String, completion: @escaping (Result<T, Error>) -> Void )  {
        guard let url = URL(string: (baseURL + url)) else {
            return
        }
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap() { element -> Data in {
//                print(String(data: element.data, encoding: .utf8))
                return element.data
            }()
            }
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
