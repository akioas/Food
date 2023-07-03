import SwiftUI

struct ProductView: View {
    @EnvironmentObject var settings: Settings

    var body: some View {

        ZStack {
            Color(.black).opacity(0.3).edgesIgnoringSafeArea(.all)
        VStack {
            Spacer()
            ZStack {
                Color(.white)
                    .frame(width: 343, height: 446)
                    .cornerRadius(15)
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            CoordinatorService.mainCoordinator.pop()
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
                    Spacer()
                        .frame(height: 24)
                }
            }
            
            Spacer()
        }
        
    }
        
    }
}


struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}
