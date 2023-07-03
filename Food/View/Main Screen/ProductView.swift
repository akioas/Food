import SwiftUI

struct ProductView: View {

    var body: some View {
        
        ZStack {
           
            VStack {
                Spacer()
                HStack {
                    Spacer()
                        .frame(width: 16)
                    Product()
                       
                    
                    Spacer()
                        .frame(width: 16)
                }
                Spacer()
            }
            
        }
        
    }
}

struct Product: View {
    @EnvironmentObject var settings: Settings
    var body: some View {
        ZStack {
            Color(.white)
                .cornerRadius(15)
            if let dish = settings.dish {
                HStack {
                    Spacer()
                        .frame(width: 16)
                    VStack {
                        Spacer()
                            .frame(height: 16)
                        
                        ZStack {
                            HStack {
                                Color(red: 0.97, green: 0.97, blue: 0.96)
                                    .frame(height: 232)
                                    .cornerRadius(10)
                                Spacer()
                                    .frame(width: 16)
                            }
                            CachedImage(url: URL(string: dish.imageUrl))
                                .frame(height: 204, alignment: .center)
                            
                        }
                        
                        Spacer()
                            .frame(height: 8)
                        HStack {
                            Text(dish.name)
                                .font(
                                    Font.custom("SF Pro Display", size: 16)
                                        .weight(.medium)
                                )
                                .kerning(0.16)
                                .foregroundColor(.black)
                            Spacer()
                        }
                        
                        Spacer()
                            .frame(height: 8)
                        HStack {
                            Text(String(dish.price) + " ₽")
                                .font(Font.custom("SF Pro Display", size: 14))
                                .kerning(0.14)
                                .foregroundColor(.black)
                            Text("·" + String(dish.weight) + " г")
                                .font(Font.custom("SF Pro Display", size: 14))
                                .kerning(0.14)
                                .foregroundColor(.black).opacity(0.5)
                            Spacer()
                        }
                        Spacer()
                            .frame(height: 8)
                        HStack {
                            ScrollView {
                                Text(dish.description)
                                    .font(Font.custom("SF Pro Display", size: 14))
                                    .kerning(0.14)
                                    .foregroundColor(.black.opacity(0.65))
                                    .frame(alignment: .leading)
                                    .lineLimit(10)
                            }
                            Spacer()
                                .frame(width: 16)
                        }
                      //  Spacer()
                        ZStack {
                            HStack {
                                Color(red: 0.2, green: 0.39, blue: 0.88)
                                    .cornerRadius(10)
                                Spacer()
                                    .frame(width: 16)
                            }
                            Text("Добавить в корзину")
                            .font(
                            Font.custom("SF Pro Display", size: 16)
                            .weight(.medium)
                            )
                            .kerning(0.1)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                        }
                        .frame(height: 48)
                        Spacer()
                            .frame(height: 16)
                        
                      //  Spacer()
                    //        .frame(width: 16)
                        
                        
                    }
                    
                }
                VStack {
                    Spacer()
                        .frame(height: 24)
                    HStack {
                        Spacer()
                        HStack {
                            Button(action: {
                                print("")
                            }) {
                                ZStack {
                                    Color(.white)
                                        .frame(width: 40, height: 40, alignment: .center)
                                        .cornerRadius(8)
                                    Image("heart")
                                        .frame(width: 24, height: 24, alignment: .center)
                                        .foregroundColor(.black)
                                }
                                
                            }
                            
                            Button(action: {
                                settings.isShowing = false
                            }) {
                                ZStack {
                                    Color(.white)
                                        .frame(width: 40, height: 40, alignment: .center)
                                        .cornerRadius(8)
                                    Image("dismiss")
                                        .frame(width: 24, height: 24, alignment: .center)
                                        .foregroundColor(.black)
                                }
                                
                            }
                            Spacer()
                                .frame(width: 24)
                        }
                        
                    }
                    Spacer()
                    
                }
            }
        }
    }
}

