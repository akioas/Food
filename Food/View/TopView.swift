import SwiftUI

struct TopView: View {
    var body: some View {
        HStack(spacing: 4) {
            VStack {
                Image("location")
                    .frame(width: 24, height: 24)
                Spacer()
            }
            VStack(alignment: .leading, spacing: 4) {
                Text("Санкт-Петербург")
                  .font(
                    Font.custom("SF Pro Display", size: 18)
                      .weight(.medium)
                  )
                  .foregroundColor(.black)
                Text("12 Августа, 2023")
                .font(Font.custom("SF Pro Display", size: 14))
                .kerning(0.14)
                .foregroundColor(.black.opacity(0.5))
                Spacer()
            }
            Spacer()
            VStack {
                Image("photo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 44, height: 44)
                    .clipped()
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
