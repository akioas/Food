import SwiftUI

struct CategoriesView: View {
    
    @ObservedObject private var viewModel = CategoriesViewModel()
    @State var selected = CategoriesViewModel.defaultCategory
    @EnvironmentObject var settings: Settings
    let columns = [GridItem(.flexible(), spacing: 8),
                   GridItem(.flexible(), spacing: 8),
                   GridItem(.flexible(), spacing: 0)]
    
    var body: some View {
        GeometryReader { reader in
            HStack {
                Spacer()
                    .frame(width: 16)
                VStack {
                    Spacer()
                        .frame(height: 8)
                    HStack {
                        TopCategories()
                            .frame(height: 42)
                        Spacer()
                            .frame(width: 16)
                    }
                    Spacer()
                        .frame(height: 14)
                    Categories(selected: $selected, categories: $viewModel.categories)
                        .frame(height: 35)
                    Spacer()
                        .frame(height: 16)
                    HStack {
                        ScrollView(.vertical) {
                            LazyVGrid(columns: columns) {
                                if let dishes = viewModel.dishes {
                                    ForEach(0..<dishes.count, id: \.self) { index in
                                        if (dishes[index].tegs.contains(selected)) {
                                            Button(action: {
                                                CoordinatorService.mainCoordinator.push(view: ProductView(dish: dishes[index]))
                                                settings.isShowing = true
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


                            }//LazyVGrid

                        }//ScrollView
                        .frame(width: reader.size.width - 32)
                        Spacer()
                            .frame(width: 16)
                    }

                    
                }
                
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
    let color = Color(red: 0.97, green: 0.97, blue: 0.96)
    let selectedColor = Color(red: 0.2, green: 0.39, blue: 0.88)
    @Binding var selected: String
    @Binding var categories: [String]?
    var body: some View {
        ScrollView(.horizontal) {
            if let categories = categories {
                LazyHStack(spacing: 8) {
                    ForEach(0..<categories.count, id: \.self) { index in
                        Button (action: {selected = categories[index]})
                        {
                            ZStack {
                                if (categories[index] == selected) {
                                    selectedColor
                                        .cornerRadius(10)
                                } else {
                                    color
                                        .cornerRadius(10)
                                }
                                
                                VStack {
                                    Spacer()
                                        .frame(height: 10)
                                    HStack {
                                        Spacer()
                                            .frame(width: 16)
                                        if (categories[index] == selected) {
                                            Text(categories[index])
                                                .font(Font.custom("SF Pro Display", size: 14))
                                                .kerning(0.14)
                                                .foregroundColor(.white)
                                        } else {
                                            Text(categories[index])
                                                .font(Font.custom("SF Pro Display", size: 14))
                                                .kerning(0.14)
                                                .foregroundColor(.black)
                                        }
                                        Spacer()
                                            .frame(width: 16)
                                    }
                                    Spacer()
                                        .frame(height: 10)
                                }
                            }
                            .frame(height: 35)
                        }
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
