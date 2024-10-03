import Foundation
import Stinsen
import SwiftUI

extension ProfileCoordinator {
    @ViewBuilder nonisolated func makeStart() -> some View {
        MainActor.assumeIsolated {
            ProfileScreen(user: user)
        }
    }
}
