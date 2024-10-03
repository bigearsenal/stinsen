import Foundation
import Stinsen
import SwiftUI

extension MainCoordinator {
    nonisolated func makeUnauthenticated() -> NavigationViewCoordinator<UnauthenticatedCoordinator> {
        MainActor.assumeIsolated {
            NavigationViewCoordinator(UnauthenticatedCoordinator())
        }
    }

    nonisolated func makeAuthenticated(user: User) -> AuthenticatedCoordinator {
        MainActor.assumeIsolated {
            AuthenticatedCoordinator(user: user)
        }
    }
}
