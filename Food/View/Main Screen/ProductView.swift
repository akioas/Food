import SwiftUI

struct ProductView: View {
    var body: some View {
        ZStack {
            Color(.black).opacity(0.3).edgesIgnoringSafeArea(.all)
        VStack {
            Spacer()
            
            Color(.white)
                .frame(width: 343, height: 446)
                .cornerRadius(15)
            
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
