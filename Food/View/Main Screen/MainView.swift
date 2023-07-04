import SwiftUI
//первый главный экран

struct MainView: View {
    
    @ObservedObject private var viewModel = MainViewModel()
    
    var body: some View {
        
        GeometryReader { reader in
            HStack {
                Spacer()
                    .frame(width: 16)
                VStack {
                    Spacer()
                        .frame(height: 8)
                    TopView()
                        .frame(height: 42)
                    Spacer()
                        .frame(height: 15)
                    ScrollView {
                        if let category = viewModel.categories {
                            
                            ForEach((0..<category.count), id: \.self) { index in
                                Button(action: {
                                    CoordinatorService.mainCoordinator.push(view: CategoriesView())
                                })
                                {
                                    VStack {
                                        ZStack {
                                            
                                            CachedImage(url: URL(string: category[index].imageUrl))
                                                .cornerRadius(10)
                                                .frame(height: ((reader.size.height - 57) / CGFloat((category.count) <= 4 ? category.count : 4) - 8))
                                            VStack {
                                                
                                                Spacer()
                                                    .frame(height: 12)
                                                HStack {
                                                    Spacer()
                                                        .frame(width: 16)
                                                    Text(category[index].name)
                                                        .font(
                                                            Font.custom("SF Pro Display", size: 20)
                                                                .weight(.medium)
                                                        )
                                                        .kerning(0.2)
                                                        .foregroundColor(.black)
                                                        .frame(maxWidth: 191, alignment: .leading)
                                                        .multilineTextAlignment(.leading)
                                                    
                                                    Spacer()
                                                }
                                                Spacer()
                                            }
                                        }
                                        Spacer()
                                            .frame(height: 8)
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
                if (viewModel.categories == nil) {
                    viewModel.getData()
                }
            }
        }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
