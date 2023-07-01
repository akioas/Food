import SwiftUI

struct CategoriesView: View {
    var body: some View {
        HStack {
            Spacer()
                .frame(width: 16)
            VStack {
                Spacer()
                    .frame(height: 8)
                TopCategories()
                    .frame(height: 42)
                Categories()
                FoodGrid()
            }
            Spacer()
                .frame(width: 16)
        }
    }
}

struct TopCategories:  View {
    var body: some View {
        HStack {
            VStack {
                Spacer()
                Button(action: {
                    CoordinatorService.mainCoordinator.pop()
                }) {
                    Image("back")
                        .frame(width: 32, height: 32, alignment: .center)
                        .foregroundColor(.black)
                }
                Spacer()
            }
            Spacer()
            Text("Азиатская кухня")
            .font(
            Font.custom("SF Pro Display", size: 18)
            .weight(.medium)
            )
            .multilineTextAlignment(.center)
            .foregroundColor(.black)
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
                        CoordinatorService.mainCoordinator.push(view: ProductView())
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
