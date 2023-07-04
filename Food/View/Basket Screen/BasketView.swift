import SwiftUI

struct BasketView: View {
    @StateObject private var coordinator = CoordinatorService.basketCoordinator
    var body: some View {
        HStack {
            Spacer()
                .frame(width: 16)
            VStack {
                Spacer()
                    .frame(height: 8)
                TopView()
                    .frame(height: 42)
                Spacer()
                    .frame(height: 22)
                Cart()
            }
        }
    }
}

struct Cart: View {
    @State var cart = CartViewModel().getCart()
    @State var dishes = CartViewModel().getDishes()
    @State var viewCart = [Int : Int]()
    let model = CartViewModel()

    var keys: [Int]?
    var values: [Int]?
    
    var body: some View {
        
        GeometryReader { reader in
            
            ScrollView(.vertical) {
                    if let cart = cart {
                        ForEach(cart.keys.sorted(by: >), id: \.self) { key in
                            if let dishes = dishes {
                                HStack {
                                    ZStack {
                                        Color(red: 0.97, green: 0.97, blue: 0.96)
                                            .cornerRadius(6)
                                            .frame(width: 62, height: 62)
                                        CachedImage(url: URL(string: dishes[key]?.imageUrl ?? ""))
                                            .frame(width: 54, height: 54)
                                    }
                                    VStack {
                                        Spacer()
                                        HStack {
                                            Text(dishes[key]?.name ?? "")
                                                .font(Font.custom("SF Pro Display", size: 14))
                                                .kerning(0.14)
                                                .foregroundColor(.black)
                                            Spacer()
                                        }
                                        HStack {
                                            Text(String(dishes[key]?.price ?? 0) + " ₽")
                                                .font(Font.custom("SF Pro Display", size: 14))
                                                .kerning(0.14)
                                                .foregroundColor(.black)
                                            Text("· " + String(dishes[key]?.weight ?? 0) + " г")
                                                .font(Font.custom("SF Pro Display", size: 14))
                                                .kerning(0.14)
                                                .foregroundColor(.black).opacity(0.5)
                                            Spacer()
                                        }
                                        Spacer()
                                    }
                                    Spacer()
                                    HStack(alignment: .center, spacing: 6) {
                                        Button(action: {model.removeFromCart(id: key)
                                            viewCart[key]! -= 1
                                        }
                                       ) {
                                            Image("minus")
                                                .frame(width: 24, height: 24)
                                        }
                                        Spacer()
                                        if let viewCart = viewCart {
                                            if (viewCart[key] ?? 0 > 0) {
                                                
                                                Text(String(viewCart[key] ?? 0))
                                                    .kerning(0.14)
                                                    .foregroundColor(.black)
                                                    .frame(width: 16)
                                            }
                                                
                                        }
                                        
                                        Spacer()
                                        Button(action: {model.addToCart(id: key)
                                            viewCart[key]! += 1
                                        }) {
                                            Image("plus")
                                                .frame(width: 24, height: 24)
                                        }
                                    }
                                    .frame(width: 99, height: 32)
                                    .background(Color(red: 0.94, green: 0.93, blue: 0.93))
                                    .cornerRadius(10)
                                }
                            }
                        }
                    }
            }//ScrollView
            .frame(width: reader.size.width - 32)
        }
        .onAppear(perform: {
            viewCart = CartViewModel().getCart() ?? [Int : Int]()
        })
    }
}
