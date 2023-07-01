import SwiftUI

struct CategoriesView: View {
    
    @ObservedObject private var viewModel = CategoriesViewModel()
    
    let columns = [GridItem(.flexible(), spacing: 8),
                   GridItem(.flexible(), spacing: 8),
                   GridItem(.flexible(), spacing: 0)]
    @State var filtered = "Все меню"
    
    var body: some View {
        GeometryReader { reader in
            HStack {
                Spacer()
                    .frame(width: 16)
                VStack {
                    Spacer()
                        .frame(height: 8)
                    TopCategories()
                        .frame(height: 42)
                    Categories()
                    
                    ScrollView(.vertical) {
                        LazyVGrid(columns: columns) {
                            if let dishes = viewModel.dishes {
                                ForEach(0..<dishes.count, id: \.self) { index in
                                    Button(action: {
                                        CoordinatorService.mainCoordinator.push(view: ProductView())
                                    })
                                    {
                                        VStack(alignment: .leading, spacing: 5) {
                                            ZStack {
                                                Color(red: 0.97, green: 0.97, blue: 0.96)
                                                    .frame(width: (reader.size.width - 48) / 3, height: (reader.size.width - 48) / 3)
                                                    .cornerRadius(10)
                                                
                                                CachedImage(url: URL(string: dishes[index].imageUrl))
                                                    .cornerRadius(10)
                                                    .frame(width: (reader.size.width - 48) / 3 - 10, height: (reader.size.width - 48) / 3 - 10)
                                            }
                                            
                                            
                                            Text(dishes[index].name)
                                                .font(Font.custom("SF Pro Display", size: 14))
                                                .kerning(0.14)
                                                .foregroundColor(.black)
                                                .frame(maxWidth: (reader.size.width - 48) / 3, alignment: .leading)
                                                .multilineTextAlignment(.leading)
                                                .lineLimit(2)
                                            Spacer()
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                }
                Spacer()
                    .frame(width: 16)
            }
            .onAppear {
                if (viewModel.dishes == nil) {
                    viewModel.getData()
                }
            }
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


struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
