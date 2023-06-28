import SwiftUI


struct MainTabView: View {
    
    init() {
        let image = UIImage.gradientImageWithBounds()

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
            Text("")
                .tabItem {
                    Image(systemName: "house")
                    Text("Главная")
                }
            Text("Категория")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Категория")
                }
            Text("Корзина")
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

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}



extension UIImage {
    static func gradientImageWithBounds() -> UIImage {
    let bounds = CGRect( x: 0, y: 0, width: UIScreen.main.scale, height: 1
    )
        let gradientLayer = CALayer()
        gradientLayer.frame = bounds
        gradientLayer.backgroundColor = UIColor.gray.cgColor
        
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
