import Foundation
import Stinsen
import SwiftUI

extension UnauthenticatedCoordinator {
    nonisolated func makeRegistration() -> RegistrationCoordinator {
        MainActor.assumeIsolated {
            RegistrationCoordinator(services: unauthenticatedServices)
        }
    }

    @ViewBuilder nonisolated func makeForgotPassword() -> some View {
        MainActor.assumeIsolated {
            ForgotPasswordScreen(services: unauthenticatedServices)
        }
    }

    @ViewBuilder nonisolated func makeStart() -> some View {
        MainActor.assumeIsolated {
            LoginScreen(services: unauthenticatedServices)
        }
    }
}
