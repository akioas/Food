import SwiftUI

struct BasketView: View {
    @StateObject private var coordinator = BasketCoordinator
    var body: some View {
        VStack {
            TopView()
            ScrollView {
                HStack(alignment: .center, spacing: 8) {
                    ZStack {
                        Image("rice-with-vegetables 1")
                            .position(x: 35, y: 36)
                        Image(systemName: "circle")
                            .position(x: 34, y: 34)
                    }
                    .background(Color(red: 0.97, green: 0.97, blue: 0.96))
                    .cornerRadius(6)
                    VStack(alignment: .leading, spacing: 4) {
                        
                        Text("Зеленый салат")
                            .font(.custom("SF Pro Display", size: 14))
                            .foregroundColor(Color(red: 0, green: 0, blue: 0))
                        
                    }
                }
            }
            ZStack {
                ZStack {
                    Text("Оплатить 2 004 ₽")
                        .font(.custom("SF Pro Display", size: 16))
                        .foregroundColor(Color(red: 1, green: 1, blue: 1))
                }
                .background(Color(red: 1, green: 1, blue: 1))
                .position(x: 171.5, y: 24)
            }
            .padding(.horizontal, 144)
            .padding(.vertical, 14)
            .background(Color(red: 0.20, green: 0.39, blue: 0.88))
            .cornerRadius(10)
        }
    }
}
