import SwiftUI

struct CategoriesView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Азиатская кухня")
                Spacer()
                ZStack {
                    Image(systemName: "circle")
                        .background(Color(red: 1, green: 1, blue: 1))
                        .cornerRadius(100)
                }
                
            }
            Categories()
            FoodGrid()
        }
    }
}

struct Categories:  View {
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            HStack(alignment: .top, spacing: 10) {
                Text("Все меню")
                    .font(.custom("SF Pro Display", size: 14))
                    .foregroundColor(Color(red: 1, green: 1, blue: 1))
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(Color(red: 0.20, green: 0.39, blue: 0.88))
            .cornerRadius(10)
            HStack(alignment: .top, spacing: 10) {
                Text("Салаты")
                    .font(.custom("SF Pro Display", size: 14))
                    .foregroundColor(Color(red: 0, green: 0, blue: 0))
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(Color(red: 0.97, green: 0.97, blue: 0.96))
            .cornerRadius(10)
            HStack(alignment: .top, spacing: 10) {
                Text("С рисом")
                    .font(.custom("SF Pro Display", size: 14))
                    .foregroundColor(Color(red: 0, green: 0, blue: 0))
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(Color(red: 0.97, green: 0.97, blue: 0.96))
            .cornerRadius(10)
            HStack(alignment: .top, spacing: 10) {
                Text("С рыбой")
                    .font(.custom("SF Pro Display", size: 14))
                    .foregroundColor(Color(red: 0, green: 0, blue: 0))
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(Color(red: 0.97, green: 0.97, blue: 0.96))
            .cornerRadius(10)
            HStack(alignment: .top, spacing: 10) {
                Text("Роллы")
                    .font(.custom("SF Pro Display", size: 14))
                    .foregroundColor(Color(red: 0, green: 0, blue: 0))
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(Color(red: 0.97, green: 0.97, blue: 0.96))
            .cornerRadius(10)
        }
    }
}

struct FoodGrid: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: columns) {
                VStack(alignment: .leading, spacing: 5) {
                    Button(action: {
                        Coordinator.push(view: ProductView())
                    })
                    {
                        ZStack {
                            Image(systemName: "circle")
                                .position(x: 59.5, y: 62)
                        }
                        .background(Color(red: 0.97, green: 0.97, blue: 0.96))
                        .cornerRadius(10)
                        Text("Рис с овощами")
                            .font(.custom("SF Pro Display", size: 14))
                            .foregroundColor(Color(red: 0, green: 0, blue: 0))
                    }
                }
            }
        }
        
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
