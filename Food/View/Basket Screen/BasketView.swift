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
    @State var cartKeys = CartViewModel().getCart().map({$0.keys})
    @State var cart = CartViewModel().getCart()
    @State var dishes = CartViewModel().getDishes()
    var keys: [Int]?
    var values: [Int]?
    
    var body: some View {
       
        GeometryReader { reader in
            
            ScrollView(.vertical) {
                if let cart = cart {
                    if let cart = cart {
                        ForEach(cart.keys.sorted(by: >), id: \.self) { key in
                            if let dishes = dishes {
                                HStack {
                                    ZStack {
                                        Color(red: 0.97, green: 0.97, blue: 0.96)
                                        CachedImage(url: URL(string: dishes[key]?.imageUrl ?? ""))
                                    }
                                }
                            }
                        }
                    }
            }
        }//ScrollView
        .frame(width: reader.size.width - 32)
    }
    }
}
