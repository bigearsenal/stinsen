import Foundation
import Stinsen
import SwiftUI

extension RegistrationCoordinator {
    @ViewBuilder nonisolated func makeStart() -> some View {
        MainActor.assumeIsolated {
            UserRegistrationScreen()
        }
    }

    @ViewBuilder nonisolated func makePassword(username: String) -> some View {
        MainActor.assumeIsolated {
            PasswordRegistrationScreen(services: services, username: username)
        }
    }
}
