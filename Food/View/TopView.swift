import SwiftUI

struct TopView: View {
    var body: some View {
        HStack {
            VStack {
                Spacer()
                    .frame(height: 5)
                Image("location")
                Spacer()
            }
            VStack(alignment: .leading, spacing: 4) {
                Text("Санкт-Петербург")
                    .font(.custom("SF Pro Display", size: 18))
                    .foregroundColor(Color(red: 0, green: 0, blue: 0))
                Text("12 Августа, 2023")
                    .font(.custom("SF Pro Display", size: 14))
                    .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 0.50))
                Spacer()
            }
            Spacer()
            VStack {
                Image("photo")
                    .cornerRadius(100)
                Spacer()
            }
            
        }
    }
}


struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
    }
}
