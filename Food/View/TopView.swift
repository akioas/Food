import SwiftUI
import CoreLocation
//верхняя часть экрана с локацией и датой

struct TopView: View {
    @StateObject var locationManager = LocationManager()
    //дата
    var today: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "dd MMMM, YYYY"
        return dateFormatter.string(from: Date())
    }
    var body: some View {
        HStack(spacing: 4) {
            VStack {
                Image("location")
                    .frame(width: 24, height: 24)
                    .foregroundColor(.black)
                Spacer()
            }
            VStack(alignment: .leading, spacing: 4) {
                
                Text(String(locationManager.city))
                    .font(
                        Font.custom("SF Pro Display", size: 18)
                            .weight(.medium)
                    )
                    .foregroundColor(.black)
                Text(today)
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
        .onAppear(perform: {
            locationManager.startUpdating()
        }
        )
    }
}

