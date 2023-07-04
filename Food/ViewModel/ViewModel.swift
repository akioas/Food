import SwiftUI
//для экранов с загрузкой данных

protocol ViewModel: ObservableObject {
    func getData()
    var apiManager: APIManager { get }
    var url: String { get }
}
