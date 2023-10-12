import Foundation
import Stinsen
import SwiftUI

extension UnauthenticatedCoordinator {
    func makeRegistration() -> RegistrationCoordinator {
        return RegistrationCoordinator(services: unauthenticatedServices)
    }

    @ViewBuilder func makeForgotPassword() -> some View {
        ForgotPasswordScreen(services: unauthenticatedServices)
    }

    @ViewBuilder func makeStart() -> some View {
        LoginScreen(services: unauthenticatedServices)
    }
}
