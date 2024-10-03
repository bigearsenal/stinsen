import Foundation
import Stinsen
import SwiftUI

extension HomeCoordinator {
    @ViewBuilder nonisolated func makeStart() -> some View {
        MainActor.assumeIsolated {
            HomeScreen(todosStore: todosStore)
        }
    }
}
