import SwiftUI

struct TopView: View {
    var body: some View {
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
    }
}
