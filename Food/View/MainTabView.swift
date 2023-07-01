import SwiftUI


struct MainTabView: View {
    @StateObject private var mainCoordinator = CoordinatorService.mainCoordinator
    @StateObject private var basketCoordinator = CoordinatorService.basketCoordinator
    init() {
        let image = UIImage.imageWithBounds()
        
        let appearance = UITabBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = UIColor.white
        appearance.backgroundImage = UIImage()
        appearance.shadowImage = image
        
        UITabBar.appearance().scrollEdgeAppearance = appearance
        UITabBar.appearance().standardAppearance = appearance
    }
    
    var body: some View {
        
        TabView {
            ZStack {
                mainCoordinator.container.view
                    .transition(.push(from: .bottom))
            }
                .tabItem {
                    Image("main")
                        .frame(width: 28, height: 28)
                    Text("Главная")
                }
            Text("Поиск")
                .tabItem {
                    Image("search")
                        .frame(width: 24, height: 24)
                    Text("Поиск")
                }
            ZStack {
                basketCoordinator.container.view
                    .transition(.push(from: .bottom))
            }
                .tabItem {
                    Image("basket")
                        .frame(width: 28, height: 28)
                    Text("Корзина")
                }
            Text("Аккаунт")
                .tabItem {
                    Image("account")
                        .frame(width: 28, height: 28)
                    Text("Аккаунт")
                }
        }
        .foregroundColor(Color(UIColor(red: 0.65, green: 0.66, blue: 0.67, alpha: 1)))
        .accentColor(Color(UIColor(red: 51/255, green: 100/255, blue: 224/255, alpha: 1)))
        
    }
    
}


extension UIImage {
    static func imageWithBounds() -> UIImage {
        let bounds = CGRect( x: 0, y: 0, width: UIScreen.main.scale, height: 2)
        let layer = CALayer()
        layer.frame = bounds
        layer.backgroundColor = CGColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1)
        
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
