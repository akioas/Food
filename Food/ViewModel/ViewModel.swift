import SwiftUI

protocol ViewModel: ObservableObject {
    func getData()
    var apiManager: APIManager { get }
    var url: String { get }
}
