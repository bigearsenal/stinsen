import Foundation
import Stinsen
import SwiftUI

final class RegistrationCoordinator: NavigationCoordinatable {
    let stack = NavigationStack(initial: \RegistrationCoordinator.start)
    let services: UnauthenticatedServices

    @Root var start = makeStart
    @Route(.push) var password = makePassword

    init(services: UnauthenticatedServices) {
        self.services = services
    }

    deinit {
        print("Deinit RegistrationCoordinator")
    }
}
