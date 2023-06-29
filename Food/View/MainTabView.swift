import SwiftUI


struct MainTabView: View {
    
    init() {
        let image = UIImage.imageWithBounds()
        
        let appearance = UITabBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = .white
        appearance.backgroundImage = UIImage()
        appearance.shadowImage = image
        
        UITabBar.appearance().scrollEdgeAppearance = appearance
        UITabBar.appearance().standardAppearance = appearance
    }
    
    var body: some View {
        
        TabView {
            MainView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Главная")
                }
            Text("Категория")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Категория")
                }
            BasketView()
                .tabItem {
                    Image(systemName: "trash")
                    Text("Корзина")
                }
            Text("Аккаунт")
                .tabItem {
                    Image(systemName: "person")
                    Text("Аккаунт")
                }
        }
        
    }
    
}


extension UIImage {
    static func imageWithBounds() -> UIImage {
        let bounds = CGRect( x: 0, y: 0, width: UIScreen.main.scale, height: 1)
        let layer = CALayer()
        layer.frame = bounds
        layer.backgroundColor = UIColor.gray.cgColor
        
        UIGraphicsBeginImageContext(layer.bounds.size)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}


struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
