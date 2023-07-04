import SwiftUI
//координатор

struct ContainerView : View {
    var view : AnyView
    
    init<V>(view: V) where V: View {
        self.view = AnyView(view)
    }
    
    var body: some View {
        view
    }
}

class CoordinatorService: ObservableObject {
    
    static let mainCoordinator = CoordinatorService(rootView: MainView())
    static let basketCoordinator = CoordinatorService(rootView: BasketView())
    
    var rootView: any View

    @Published var container : ContainerView!
    
    private var stack  = [ContainerView]() {
        didSet {
            if let view = stack.last {
                //withAnimation {
                    self.container = view
               // }
            }
        }
    }
    
    init(rootView: any View) {
        self.rootView = rootView
        self.push(view: rootView)
    }
    
    func pop() {
        guard self.stack.count > 1 else { return }
        self.stack.remove(at: self.stack.count - 1)
    }
    
    func push<V: View>(view: V) {
        let containered = ContainerView(view: view)
        self.stack += [containered]
    }
    
    func root() {
        self.stack.removeAll()
        self.push(view: rootView)
    }
    
}
