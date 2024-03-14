import Foundation
import Stinsen
import SwiftUI

extension TestbedEnvironmentObjectCoordinator {
    @ViewBuilder func makePushScreen() -> some View {
        TestbedEnvironmentObjectScreen()
    }

    @ViewBuilder func makeModalScreen() -> some View {
        SwiftUI.NavigationStack {
            TestbedEnvironmentObjectScreen()
        }
    }

    func makePushCoordinator() -> TestbedEnvironmentObjectCoordinator {
        TestbedEnvironmentObjectCoordinator()
    }

    func makeModalCoordinator() -> NavigationViewCoordinator<TestbedEnvironmentObjectCoordinator> {
        NavigationViewCoordinator(TestbedEnvironmentObjectCoordinator())
    }

    @ViewBuilder func makeStart() -> some View {
        TestbedEnvironmentObjectScreen()
    }
}
