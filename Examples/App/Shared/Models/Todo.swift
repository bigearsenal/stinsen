import Foundation

struct Todo: Identifiable, Codable {
    let id: UUID
    var name: String
    var isFavorite: Bool

    init(name: String) {
        id = UUID()
        self.name = name
        isFavorite = false
    }
}
