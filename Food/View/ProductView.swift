import SwiftUI

struct ProductView: View {
    var body: some View {
        VStack {
            Spacer()
            
            
            ZStack {
                        Image(systemName: "circle")
                            .position(x: 156, y: 116)
                        HStack(alignment: .center, spacing: 10) {
                        }
                        .padding(.all, 10)
                        .background(Color(red: 1, green: 1, blue: 1))
                        .cornerRadius(8)
                        .position(x: 235, y: 28)
                        HStack(alignment: .center, spacing: 10) {
                        }
                        .padding(.all, 10)
                        .background(Color(red: 1, green: 1, blue: 1))
                        .cornerRadius(8)
                        .position(x: 283, y: 28)
                    }
                    .background(Color(red: 0.97, green: 0.97, blue: 0.96))
                    .cornerRadius(10)
            
            Text("Рыба с овощами и рисом")
                        .font(.custom("SF Pro Display", size: 16))
                        .foregroundColor(Color(red: 0, green: 0, blue: 0))
            
            Text("Рыба маринованная со специями, лимонным соком, соевым соусом и запечeнная в духовке с лучком, томатами и картошечкой под золотистой майонезно-сырной шубкой")
                        .font(.custom("SF Pro Display", size: 14))
                        .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 0.65))
            
            
            
            Spacer()
        }
        
    }
}


struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}
