import SwiftUI


struct ContentView: View {
    
    
    var body: some View {
        MainTabView()
        .preferredColorScheme(.light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
