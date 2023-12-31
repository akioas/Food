import SwiftUI
//для сохранения картинок в кэше, View

struct CachedImage: View {
    
    private var url: URL?
    @ObservedObject var image: UrlImageModel
    init(url: URL?) {
        self.url = url
        image = UrlImageModel(url: url)
    }
    
    var body: some View {
        if let image = image.image {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
        } else {
            ProgressView()
        }
    }

}
