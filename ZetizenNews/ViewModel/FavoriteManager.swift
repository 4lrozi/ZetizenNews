import Foundation


class FavoriteManager: ObservableObject {
    @Published private(set) var newses: [ZetizenNewsItem] = []
    @Published var isFav = false
    
    
    func addToFavorite(item : ZetizenNewsItem) {
        newses.append(item)
    }
    
    func removeFromFavorite(item: ZetizenNewsItem) {
        newses = newses.filter { $0.id != item.id }
    }
}
