import Foundation
import Stinsen
import SwiftUI

extension HomeCoordinator {
    @ViewBuilder func makeStart() -> some View {
        HomeScreen(todosStore: todosStore)
    }
}
