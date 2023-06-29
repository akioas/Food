import SwiftUI

struct MainView: View {
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Санкт-Петербург")
                            .font(.custom("SF Pro Display", size: 18))
                            .foregroundColor(Color(red: 0, green: 0, blue: 0))
                        Text("12 Августа, 2023")
                            .font(.custom("SF Pro Display", size: 14))
                            .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 0.50))
                    }
                    Spacer()
                    ZStack {
                        Image(systemName: "circle")
                            .background(Color(red: 1, green: 1, blue: 1))
                            .cornerRadius(100)
                    }
                    
                }
                ScrollView {
                    ZStack {
                        Image(systemName: "circle")
                            .position(x: 282, y: 126)
                        Image(systemName: "circle")
                            .position(x: 366, y: 41)
                        Text("Пекарни  и кондитерские ")
                            .font(.custom("SF Pro Display", size: 20))
                            .foregroundColor(Color(red: 0, green: 0, blue: 0))
                        Image(systemName: "circle")
                            .position(x: 192, y: 143.5)
                    }
                    .background(Color(red: 1, green: 0.95, blue: 0.82))
                    .cornerRadius(10)
                }
            }
            Spacer()
        }
    }
    
    
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
