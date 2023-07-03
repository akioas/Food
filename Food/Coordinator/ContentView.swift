import SwiftUI


struct ContentView: View {
    @StateObject var settings = Settings()
    var body: some View {
        ZStack {
            MainTabView()
                .preferredColorScheme(.light)
        }
        .environmentObject(settings)
    }
}
