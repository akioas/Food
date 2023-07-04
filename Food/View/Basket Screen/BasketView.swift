import SwiftUI

struct BasketView: View {
    var body: some View {
        HStack {
            Spacer()
                .frame(width: 16)
            VStack {
                Spacer()
                    .frame(height: 8)
                HStack {
                    TopView()
                        .frame(height: 42)
                    Spacer()
                        .frame(width: 16)
                }
                
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
    @State var sum = CartViewModel().calc()

    let model = CartViewModel()

    var keys: [Int]?
    var values: [Int]?
    
    var body: some View {
        
        GeometryReader { reader in
            VStack {
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
                                    HStack(alignment: .center) {
                                        Spacer()
                                            .frame(height: 6)
                                        Button(action: {model.removeFromCart(id: key)
                                            viewCart[key]! -= 1
                                            sum = CartViewModel().calc()
                                        }
                                        ) {
                                            Image("minus")
                                                .frame(width: 24, height: 24)
                                        }
                                        Spacer()
                                            .frame(height: 6)
                                        if let viewCart = viewCart {
                                            if (viewCart[key] ?? 0 > 0) {

                                                Text(String(viewCart[key] ?? 0))
                                                    .kerning(0.14)
                                                    .foregroundColor(.black)
                                                    .frame(width: 22)
                                            }

                                        }

                                        Spacer()
                                        Button(action: {model.addToCart(id: key)
                                            viewCart[key]! += 1
                                            sum = CartViewModel().calc()
                                        }) {
                                            Image("plus")
                                                .frame(width: 24, height: 24)
                                        }
                                        Spacer()
                                    }
                                    .frame(width: 100, height: 32)
                                    .background(Color(red: 0.94, green: 0.93, blue: 0.93))
                                    .cornerRadius(10)
                                }
                            }
                        }
                    }
                    Spacer()

                }//ScrollView
                .frame(width: reader.size.width - 16)
                
            }
            VStack {
                Spacer()

                HStack {
                    ZStack {
                        Color(red: 0.2, green: 0.39, blue: 0.88)
                            .cornerRadius(10)
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                Text("Оплатить " + String(sum) + " ₽")
                                    .font(
                                        Font.custom("SF Pro Display", size: 16)
                                            .weight(.medium)
                                    )
                                    .kerning(0.1)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            Spacer()
                        }
                    }
                    Spacer()
                        .frame(width: 16)
                }
                .frame(height: 48)

                Spacer()
                    .frame(height: 16)
            }
            
        }
        .onAppear(perform: {
            viewCart = CartViewModel().getCart() ?? [Int : Int]()
        })
    }
}
